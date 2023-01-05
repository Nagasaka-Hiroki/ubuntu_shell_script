# Ubuntuを便利に使うためのshell script
## 概要
Ubuntuを便利に使うためのshell scriptを作っていく。  
分散すると厄介なのでここにまとめておいて管理する。

---

追記：  
処理の一部をRubyに任せることがある。shell scriptというタイトルだが、あくまでも目的はUbuntuを便利に使うことである。そのためRubyに任せた方がいい場合は積極的にRubyを使用する。Rubyを選択する理由は、Rubyの学習を兼ねてである。

Rubyのバージョンは`3.1.2`（作成時の最新安定版）としている。

---

## 操作記録
### ソースの入手とコマンド化
コマンド化の操作を備忘録として記録する。  
`/usr/local/bin`にファイルをダウンロードし、`/usr/bin`にシンボリックリンクを作成。必要に応じて`~/.bash_aliases`にエイリアスを作成して入力を短縮する。コマンド化するスクリプトファイルを`xxx.sh`としコマンドを`xxx`として作成する。
```
$ cd /usr/local/bin
$ sudo git clone https://github.com/Nagasaka-Hiroki/ubuntu_shell_script.git
$ sudo ln -s /usr/local/bin/ubuntu_shell_script/xxx.sh /usr/bin/xxx
```
上記の一連のコマンドで新しいコマンド`xxx`が使えるようになったはず。  
もしターミナルの再起動が必要であれば`exec $SHELL -l`でその場で再起動できるはず。

また、新しいスクリプトが作成された場合は`git pull`コマンドでリポジトリの更新を取得すれば良い。

追記：  
スクリプトの修正を`push`したあとは、単純に`sudo git pull`で変更を取得すれば更新できる。

- 参考  
> - [新しいLinuxの教科書(SB Creativeのサイトに飛びます)](https://www.sbcr.jp/product/4797380941/)
> - [https://blog.katsubemakito.net/articles/install_plantuml_for_ubuntu](https://blog.katsubemakito.net/articles/install_plantuml_for_ubuntu)
> - [https://qiita.com/valzer0/items/67a4c8bf2b1be0fc825a](https://qiita.com/valzer0/items/67a4c8bf2b1be0fc825a)
> - [https://codelikes.com/git-pull/](https://codelikes.com/git-pull/)

# スクリプトリスト

1. [make_todo_index.sh](https://github.com/Nagasaka-Hiroki/ubuntu_shell_script#make_todo_indexsh)
1. [./get_ref_md/get_ref_md.sh](https://github.com/Nagasaka-Hiroki/ubuntu_shell_script#get_ref_mdget_ref_mdsh)
1. [./get_domain_name/get_domain_name.sh](https://github.com/Nagasaka-Hiroki/ubuntu_shell_script#get_domain_nameget_domain_namesh)
1. [./remove_new_line/remove_new_line.sh](https://github.com/Nagasaka-Hiroki/ubuntu_shell_script#remove_new_lineremove_new_linesh)

## make_todo_index.sh
### 概要
日誌のはじめに書く行をクリップボードに入力する。

### 使い方
以下のように実行する
```
./make_todo_index.sh xxx yyy zzz
```
以下の出力を得る。
```
## 2022/11/12-土曜日
### ToDo
|ToDo|result|
|-|-|
|xxx||
|yyy||
|zzz||

### 作業記録
#### xxx
#### yyy
#### zzz
```

## ./get_ref_md/get_ref_md.sh
### 概要
作業記録の途中でWebサイトのURLとタイトルを毎回両方コピーするのが面倒。これを解消する。

すなわち、コマンドを実行することで以下の内容を取得する。
```bash
$ ./get_ref_md.sh reference_url
#クリップボードに以下を保存する。
[title of reference](reference_url)
```
しかし、実行によって引数に渡したURLにアクセスする。そのためむやみに実行しないように注意する。

また、実行の本体はrubyでバージョンは`3.1.2`である。

### 使い方
```bash
$ ./get_ref_md.sh reference_url
#クリップボードに以下を保存する。
[title of reference](reference_url)
```

### Nokogiri
このプログラムはNokogiri gemを使っている。このgemはMITライセンスの元で利用できる。以下にNokogiriのライセンス条文のURLを示す。

- 著作権表記  
Copyright 2008 -- 2021 by Mike Dalessio, Aaron Patterson, Yoko Harada, Akinori MUSHA, John Shahid, Karol Bucek, Sam Ruby, Craig Barnes, Stephen Checkoway, Lars Kanis, Sergio Arbeo, Timothy Elliott, Nobuyoshi Nakada, Charles Nutter, Patrick Mahoney.

- ライセンス全文  
[nokogiri/LICENSE.md](https://github.com/sparklemotion/nokogiri/blob/main/LICENSE.md)

### 追記
1. コマンド化でload errorが出たので修正する。パスを取得してファイル名に付け足す。
1. シンボリックリンクの場合エラーが出るので修正。
1. readlinkの出力がターミナルに出る。リダイレクトを/dev/nullに変更する。以下参考  
[５分で一通り理解できる！Linuxのリダイレクト 使い方と種類まとめ](https://eng-entrance.com/linux-redirect)
1. セキュリティに関する通知が後日届いたためGemfileの内容を変更して`bundle update`を実行。

### 改良
　タイトルによっては`|（パイプ）`が入っていることがある。しかしマークダウンでは表の一つとして認識されて修正が面倒になる。そのため`｜（全角のパイプ）`に変換すると回避できるため、置換する処理を加える。

置換の方法は正規表現を使う。以下のサイトを使うととても便利である。
- [Rubular: a Ruby regular expression editor](https://rubular.com/)

末尾に`gsub`を追加するだけだがこれでパイプ(厳密には半角パイプの前後の空白も含む)を全角のパイプに置換することができる。

```ruby
print doc.at('title').inner_html.gsub(/[\s]*[\|][\s]*/,"｜")
```

正規表現のメタ文字は以下を参考にした。
- [正規表現サンプル集](https://www.megasoft.co.jp/mifes/seiki/meta.html)

またrubyの正規表現については以下に書かれている。
- [正規表現 (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/doc/spec=2fregexp.html)


## ./get_domain_name/get_domain_name.sh
### 背景
　Google検索ではドメインを指定して検索することができる。例えばgithub.comのサイトの情報を調べたいときには以下のように検索すれば目的の情報に効果的にたどり着くことができる。

```
site:github.com words_you_want_to_know
```
これでgithub.com上の`words_you_want_to_know`という言葉をGoogle側で検索することができる。  
これはGoogleの検索方法の一種で、検索精度を高める手段である。以下に検索精度を高める方法について説明しているサイトを示す。以下のサイトはGoogleが提供している情報であるため信頼性が高く、かつ簡潔にまとまっているので非常に参考になると思う。
- [Refine web searches - Google Search Help](https://support.google.com/websearch/answer/2466433)

　この例では覚えやすい`github.com`を例に上げた。しかしよく使用するサイトが覚えやすいとは限らない。例えばrubyのリファレンスのURLである以下に示す。
- [https://docs.ruby-lang.org/ja/3.1/doc/index.html](https://docs.ruby-lang.org/ja/3.1/doc/index.html)

上記サイトで検索する場合は以下のように検索する。
```
site:docs.ruby-lang.org/ja/3.1 words_you_want_to_know
```
覚えられないわけではないが、正直面倒である。他にも別のサイトで絞り込みたい場合にはより多くのドメイン名を覚えいないといけない。

プログラムはこういった覚える操作が得意なのでコマンド化すれば検索が効率化できると考え制作しようと考えた。
### 使い方
以下のように実行する。
```bash
$ ./get_domain_name.sh
#ドメインのリスト一覧が表示される

$ ./get_domain_name.sh RUBY
または
$ ./get_domain_name.sh ruby
#site:docs.ruby-lang.org/ja をコピーする。

$ ./get_domain_name.sh wrong_word
入力したキーに対応するドメインがありません
引数なしで実行すればドメインの一覧が出ます
```

### メモ
　使用するサイトが増える場合は再度コードを追加する。今はrubyのクラスとして実装しているが、量によってはデータとして分離したほうがいいかもしれない。この点は今後の課題とする。

### 参考
改行周りが上手く行かなかったので以下を参考にした。
- [bash で改行文字が echo で表示されない - ハックノート](https://hacknote.jp/archives/28215/)

rubyのexit文に関しては以下を参考にした。
- [Kernel.#exit (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Kernel/m/exit.html)

### 追記
追記は移動しました。追加内容などについて以下に記しています。
- [./get_domain_name/readme.md](https://github.com/Nagasaka-Hiroki/ubuntu_shell_script/tree/main/get_domain_name)

## ./remove_new_line/remove_new_line.sh
### 背景
　Webを閲覧していると英文のサイトを読むことがある。ブラウザの拡張機能を使えば簡単に日本語に訳してくれるが、それだけでは不十分な場合がある。それが文章の途中に改行を含む場合である。  
　私が確認できる範囲ではブラウザの拡張機能は改行までを一文として訳してくれる。しかし訳の内容がおかしい場合があり、その場合はテキストをコピーして手動で改行を削除していた。短いテキストであれば原文を読んでおかしい部分を補うことは難しくない。しかし、サイト全体が多分に改行を含んでいる場合はそれも難しい。例えば以下のサイトなどである。

- [RFC 6455: The WebSocket Protocol](https://www.rfc-editor.org/rfc/rfc6455)

　上記はWebSocketの仕様を示したサイトであり、とても重要なものだと考えている。一応上記の場合は有志の方が日本語に訳してくれている。

- [RFC 6455 - The WebSocket Protocol （日本語訳）](https://triple-underscore.github.io/RFC6455-ja.html)

　しかし、学習の一環としてなるべく原文を読みたい。その過程で意味が曖昧なところはGoogle翻訳にかけて意味を調べたいというときがある。やりたいことは改行を取り除くことだが、本当にやりたいことはその後のテキストの意味を知ることである。そのため可能な限り確実にかつ早く改行を除外したい。そのためこの改行削除作業をコマンド化して効率化を図る。

### 使い方
　コマンドを実行すると`vim`が起動する。改行込のテキストを入力するためには、通常のコマンドラインだと不便だと思った。そのためテキストエディタを使い入力する。エディタは何でもいいが、自分がコマンドラインからよく使う`vim`を選択肢した。  
　`vim`の場合、`Ctrl+Shift+V`でコピーしたものを貼り付けできる（ノーマルモードで貼り付けできた）。テキスト入力が終わったら保存（`:wq`）する。入力の必要がなければ保存せずに終了する（`:q`）。

　以下の挙動をする。

1. ファイルを作成→一行づつに分離してクリップボードにコピー
1. ファイルが空　→警告を出して終了。

