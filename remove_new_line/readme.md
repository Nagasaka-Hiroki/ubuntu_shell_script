# remove_new_line
　今回は作業が少し複雑なので作業内容を簡単に記録する。

　ファイルを操作するので例外処理が必要。手動で確認すると時間がかかるので今回はテストを導入する。

　minitestの参考は以下。
- [ File: README — Documentation for minitest (5.17.0) ](https://www.rubydoc.info/gems/minitest)
- [minitest-5.17.0 Documentation](https://docs.seattlerb.org/minitest/)


## 例外の特定
　irbで以下を実験。`a`は存在しないファイル。
```ruby
irb(main):001:0> f=File.open("a")
(irb):1:in `initialize': No such file or directory @ rb_sysopen - a (Errno::ENOENT)       
```

存在しないファイルを開こうとすると`Errno::ENOENT`が出るらしい。ただ、例外の意味は環境依存らしい。以下参考。
- [class Errno::EXXX (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/class/Errno=3a=3aEXXX.html)

疑問は存在するファイルを指定して開くことに失敗することはあるのだろうか？  
→今はないとして考える。使ううちに問題が出ると思うのでそのときに対処する。

minitestの検証は以下が参考。
- [ Module: Minitest::Assertions — Documentation for minitest (5.17.0) ](https://www.rubydoc.info/gems/minitest/Minitest/Assertions)
- [module Minitest::Assertions - minitest-5.17.0 Documentation](https://docs.seattlerb.org/minitest/Minitest/Assertions.html)

また、処理本体に関しては以前クラスを使ったが、インスタンスを作らないのであればmoduleのほうがいいと思った。

以下実験。

```ruby
irb(main):001:0> Object::A.puts_a
(irb):1:in '<main>': uninitialized constant A (NameError)
irb(main):002:1* module A
irb(main):003:2*   def puts_a
irb(main):004:2*     puts "a"
irb(main):005:1*   end
irb(main):006:0> end
=> :puts_a
irb(main):007:0> A.puts_a
(irb):7:in '<main>': undefined method 'puts_a' for A:Module (NoMethodError)
irb(main):008:0> Object::A.puts_a
(irb):8:in '<main>': undefined method 'puts_a' for A:Module (NoMethodError)
irb(main):009:0> Object.include?(A)
=> false
irb(main):010:0> include A
=> Object
irb(main):011:0> Object.include?(A)
=> true
irb(main):012:0> Object::A.puts_a
a
=> nil 
irb(main):013:0> A.puts_a
a
=> nil
```
includeをクラス内でしない場合Objectに対してインクルードされる。

下調べ。ファイルの位置を知りたければ以下。
- [変数と定数 (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/doc/spec=2fvariables.html)

上記によれば以下だそうだ。
```ruby
File.expand_path(__FILE__)
```

テストファイルに書くとテストファイルのパスが出る。

- [File.dirname (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/File/s/dirname.html)

dirnameがある。これでパスがわかる。

```ruby
    #メソッドの動作確認
    def test_class_method_check
        #カレントディレクトリ(ターミナル視点。)
        p Dir.pwd
        #ファイルの絶対パス。今だとこのテストファイル
        p File.expand_path(__FILE__)
        #ファイルのディレクトリ。末尾に/はない
        p File.dirname(File.expand_path(__FILE__))
    end
```
上記のようにファイルのパスなどがわかる。

モジュールからファイルを開けるようにはなった。

テストについて、setupとteardownがある。厳密には`before_*`と`after_*`がある。
- [module Minitest::Test::LifecycleHooks - minitest-5.17.0 Documentation](https://docs.seattlerb.org/minitest/Minitest/Test/LifecycleHooks.html#method-i-setup)

コマンドラインオプションについては以下。
- [ File: README — Documentation for minitest (5.17.0) ](https://www.rubydoc.info/gems/minitest)

以下のコマンドでオプションがわかるそうだ。
```bash
ruby -Ilib:test test/minitest/test_minitest_test.rb --help
```

上記をそのまま実行するとエラーが出る。今の状態だと以下。

```bash
$ ruby test/remove_new_line_test.rb --help
minitest options:
    -h, --help                       Display this help.
        --no-plugins                 Bypass minitest plugin auto-loading (or set $MT_NO_PLUGINS).
    -s, --seed SEED                  Sets random seed. Also via env. Eg: SEED=n rake
    -v, --verbose                    Verbose. Show progress processing files.
        --show-skips                 Show skipped at the end of run.
    -n, --name PATTERN               Filter run on /regexp/ or string.
        --exclude PATTERN            Exclude /regexp/ or string from run.
    -S, --skip CODES                 Skip reporting of certain types of results (eg E).

Known extensions: pride, rails
    -p, --pride                      Pride. Show your testing pride!
    -w, --warnings                   Run with Ruby warnings enabled
    -e, --environment ENV            Run tests in the ENV environment
    -b, --backtrace                  Show the complete backtrace
    -d, --defer-output               Output test failures and errors after the test run
    -f, --fail-fast                  Abort test run on first failure or error
    -c, --[no-]color                 Enable color in the output
```

Railsと同様に`-n`オプションでテスト名を指定して実行できそう。ただ、テスト名をそのまま指定するとクラス名で別物として区切った同一テストが同時に走る。それは困る。  
リファレンスを読んだが分ける手段はわからなかった。クラスメソッドにすると実行できなくなる。モジュールで名前空間を分けても実行できない。

現状別名にすればいいだけなので困らないので一度放置する。頭の片隅に疑問としておいておく。

ファイルの読み込みを追加、以下のメソッド。
- [IO#readline (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/IO/i/readline.html)
- [IO#readlines (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/IO/i/readlines.html)
