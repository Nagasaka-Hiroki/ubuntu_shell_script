# Shell Script
## 概要
Ubuntuを便利に使うためのshell scriptを作っていく。  
分散すると厄介なのでここにまとめておいて管理する。

## 操作メモ
コマンド化の操作を備忘録として記録する。  
`/usr/local/bin`にファイルをダウンロードし、`/usr/bin`にシンボリックリンクを作成。必要に応じて`~/.bash_aliases`にエイリアスを作成して入力を短縮する。コマンド化するスクリプトファイルを`xxx.sh`としコマンドを`xxx`として作成する。
```
$ cd /usr/local/bin
$ sudo git clone https://github.com/Nagasaka-Hiroki/ubuntu_shell_script.git
$ sudo ln -s /usr/local/bin/ubuntu_shell_script/xxx.sh /usr/bin/xxx
$ sudo chmod 755 ubuntu_shell_script/xxx.sh 
```
上記の一連のコマンドで新しいコマンド`xxx`が使えるようになったはず。  
もしターミナルの再起動が必要であれば`exec $SHELL -l`でその場で再起動できるはず。

また、新しいスクリプトが作成された場合は`git pull`コマンドでリポジトリの更新を取得すれば良いはず。操作をした場合はここに再度記録する。

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

