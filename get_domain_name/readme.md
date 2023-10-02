# get_domain_name.sh

追記を書くとトップページを圧迫するので追記を移動する。

以下に移動する。

## 追記
以下のjavascriptのリファレンスを追加。`js`で呼び出せる。
- [Web API｜MDN](https://developer.mozilla.org/ja/docs/Web/API)

javascriptのリファレンスを追加。`es`で呼び出せる。
- [JavaScript Primer - 迷わないための入門書 #jsprimer](https://jsprimer.net/)

githubのruby on railsのサイトを追加。`gh_rails`で呼び出せる。
- [Ruby on Rails · GitHub](https://github.com/rails)

dockerのサイトを追加。`docker`で呼び出す。
- [Docker Documentation](https://docs.docker.com/)  
追記：以下のURLに差し替え。
- [Docker ドキュメント](https://matsuand.github.io/docs.docker.jp.onthefly/)

dockerの日本語リファレンスを追加。`docker_jp`で呼び出す。
- [Docker ドキュメント日本語化プロジェクト — Docker-docs-ja 20.10 ドキュメント](https://docs.docker.jp/)

Ubuntuマニュアルのリンクを追加。`jammy`で呼び出す。バージョンはUbuntu 22.04を指定している。
- [Ubuntu Manpage: Directory Listing ](https://manpages.ubuntu.com/manpages/jammy/)

Linux全般のコマンドのリファレンス。`man_linux`で呼び出す。Ubutnu特有の動作は上記のUbuntuマニュアルを参照すると上手く行くかもしれない。
- [JM Project (Japanese)](https://linuxjm.osdn.jp/)

修正： 一覧表示を整形。  
修正： 一覧表示をもう少し修正。

Gitコマンドのリファレンスを追加。`man_git`で呼び出す。
- [Git - Reference](https://git-scm.com/docs)
Git Bookから調べる場合は、`git_book`と入力する。
- [Git - Book](https://git-scm.com/book/ja/v2)

railsのURLをバージョン7.0.4(作成時の最新安定版)に固定
- [Ruby on Rails API](https://api.rubyonrails.org/v7.0.4/)

Rubyの最新バージョン3.2.0がリリースされました。これまでリンクにバージョンを指定していなかったが、念の為`3.1`で現在は開発することが多いのでバージョンを`3.1`に固定。また、最新安定版のリファレンスを追加。`ruby_latest`で呼び出す。
- [Ruby 3.2.0 リリース](https://www.ruby-lang.org/ja/news/2022/12/25/ruby-3-2-0-released/)
- [オブジェクト指向スクリプト言語 Ruby リファレンスマニュアル (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/doc/index.html)

→追記：検索が上手く行かないのでバージョンの固定をやめる。

シェルスクリプトのリンクを追加。`sh`で呼び出す。
- [UNIX &amp; Linux コマンド・シェルスクリプト リファレンス](https://shellscript.sunone.me/)  

PostgreSQLのリンクを追加。それぞれ、`psql_jp`と`psql`で呼び出す。
- [日本PostgreSQLユーザ会｜日本PostgreSQLユーザ会](https://www.postgresql.jp/)
- [PostgreSQL: The world's most advanced open source database](https://www.postgresql.org/)

RubyGems.orgのリンクを追加。`rubygems`で呼び出す。
- [RubyGems.org｜your community gem host](https://rubygems.org/)

Redisのリンクを追加。`redis`で呼び出す。
- [Redis](https://redis.io/)

npmのリンクを追加。`npmjs`で呼び出す。
- [npm](https://www.npmjs.com/)

npmのdocsのリンクを追加。`npm_docs`で呼び出す。
- [npm Docs](https://docs.npmjs.com/)

Node.jsの18.13.0（作成時の最新安定版）のドキュメントを追加。`nodejs_18`で呼び出す。
- [Index｜Node.js v18.13.0 Documentation](https://nodejs.org/dist/latest-v18.x/docs/api/)

VSCodeのドキュメントのリンクを追加。`code`で呼び出す。
- [Documentation for Visual Studio Code](https://code.visualstudio.com/docs)

Vimの日本語リファレンスを追加する。`vim`で呼び出す。
- [help - Vim日本語ドキュメント](https://vim-jp.org/vimdoc-ja/)

Pythonのリファレンスを追加する。`python`で呼び出す。
- [Python 言語リファレンス — Python 3.11.3 ドキュメント](https://docs.python.org/ja/3/reference/index.html#reference-index)

NumPy(Python)のドキュメントを追加する。npで呼び出す。
- [NumPy documentation — NumPy v1.25 Manual](https://numpy.org/doc/stable/index.html)

Laravel9.x APIのリンクを追加する。`laravel9_api`で呼び出す。
- [Laravel9.x API](https://laravel.com/api/9.x/)

Laravel9.xのドキュメントの英語及び日本語を両方追加する。`laravel9_en`と`laravel9_docs`で呼び出す。
- [Laravel 9.x - The PHP Framework For Web Artisans](https://laravel.com/docs/9.x)
- [Laravel 9.x 日本語ドキュメント](https://readouble.com/laravel/9.x/ja/installation.html)

gradleのリンクを追加。`gradle`で呼び出す。
- [Gradle User Manual](https://docs.gradle.org/current/userguide/userguide.html)

## 挙動の確認
　使い続けるといくつか動作が上手く行かないパターンがある。例えば次のパターン

- ステータスコード3XXの場合、タイトルがステータスコードになる（記憶が曖昧だが、少なくともタイトルが入らない）
- 例えば次のURL：https://www.ipa.go.jp/security/awareness/vendor/programmingv2/web09.html  
エラーの内容は以下。
```
`connect_nonblock': SSL_connect returned=1 errno=0 peeraddr=192.218.88.180:443 state=error: unsafe legacy renegotiation disabled (OpenSSL::SSL::SSLError)
```
-  次のURLから取得すると文字化けする。  
https://e-words.jp/w/WebSocket.html

現状これらは問題が生じた場合に手動で取得している。ケースとしては少ないので対応はまた別の機会にする。

## 機能の追加
　使い続けると引数の単語をタブで補完したくなる。tipsで実験的に補完するスクリプトを作成した。試作の過程は`tips/prac_completion/readme.md`に記述している。

　前回（`tips/prac_completion`）の試作では`js`しか補完されない。そのためrubyスクリプトから補完リストを取得できるように変更する。

　新しくファイルを追加する。`completion_get_domain_name.rb`にキーの一覧を出力するコードを記述する。

メソッドは以下を参考。
- [class Hash (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/class/Hash.html#I_KEYS)

行数のカウントは以下。
- [Linux: ファイル数をカウントするコマンド｜WWWクリエイターズ](https://www-creators.com/archives/5820)

配列に関して。
- [配列を使用する｜UNIX &amp; Linux コマンド・シェルスクリプト リファレンス](https://shellscript.sunone.me/array.html)

終了ステータスに関して
- [終了ステータス｜UNIX &amp; Linux コマンド・シェルスクリプト リファレンス](https://shellscript.sunone.me/exit_status.html)

`/dev/tty`というものがあるらしい。
- [実用的なシェルスクリプト](https://www.kushiro-ct.ac.jp/yanagawa/ex-2017/3-unix/03.html)
- [ttyとは？ - Qiita](https://qiita.com/hoge_5555/items/f677f9ec7cd859380426)
- [ttyとかptsとかについて確認してみる - Qiita](https://qiita.com/toshihirock/items/22de12f99b5c40365369)

タブで補完する時以下の動作になってほしい。

1. 一つに絞れる時→その場で補完
1. 一つに絞れない時→リストを表示して次のプロンプトで入力したところまでを表示。

しかし２つ目が上手く行かない。  
→意外と簡単だった。以下でできた。

```bash
COMPREPLY=($(compgen -W "$key_list" -- "$current_input"))
```

補完は以下の挙動。

```bash
$ get_domain_name 
docker          es              git_book        jammy           man_git         mdn             rails_guide     ruby            
docker_jp       gh_rails        github          js              man_linux       rails           rails_guide_en  ruby_latest     
$ get_domain_name
``` 

これで完成とする。不足があれば後から追加する。→コードを配置して実行した結果失敗した。エラーに対応する。以下。

---

コードを配置して実行した結果以下のエラーが出た。

```bash
$ get_domain_name ruby: No such file or directory -- /usr/bin/completion_get_domain_name.rb (LoadError)
```

ソースコードの位置の特定方法を以下に変更した。
```bash
local path2script=$(dirname $(readlink -f "$(which $command_name)"))
```

---