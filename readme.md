# Shell Script
## 概要
Ubuntuを便利に使うためのshell scriptを作っていく。  
分散すると厄介なのでここにまとめておいて管理する。

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

また、新しいスクリプトが作成された場合は`git pull`コマンドでリポジトリの更新を取得すれば良いはず。操作をした場合はここに再度記録する。  
(一度失敗。mergeコマンドなど要勉強。今回は一度削除してソースの入手とコマンド化を再実行して修正した。)

- 参考  
> - [新しいLinuxの教科書(SB Creativeのサイトに飛びます)](https://www.sbcr.jp/product/4797380941/)
> - [https://blog.katsubemakito.net/articles/install_plantuml_for_ubuntu](https://blog.katsubemakito.net/articles/install_plantuml_for_ubuntu)
> - [https://qiita.com/valzer0/items/67a4c8bf2b1be0fc825a](https://qiita.com/valzer0/items/67a4c8bf2b1be0fc825a)
> - [https://codelikes.com/git-pull/](https://codelikes.com/git-pull/)

# スクリプトリスト
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

## /get_ref_md/get_ref_md.sh
### 概要
作業記録の途中でWebサイトのURLとタイトルを毎回両方コピーするのが面倒。これを解消する。

すなわち、コマンドを実行することで以下の内容を取得する。
```bash
$ ./get_ref_md.sh url_to_ref
#クリップボードに以下を保存する。
[title of ref](url_to_ref)
```
しかし、実行によって引数に渡したURLにアクセスする。そのためむやみに実行しないように注意する。

また、実行の本体はrubyでバージョンは`3.1.2`である。

### 使い方
```bash
$ ./get_ref_md.sh url_to_ref
#クリップボードに以下を保存する。
[title of ref](url_to_ref)
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
