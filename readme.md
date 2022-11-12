# Shell Script
## 概要
Ubuntuを便利に使うためのshell scriptを作っていく。  
分散すると厄介なのでここにまとめておいて管理する。

## 操作メモ
コマンド化の操作を備忘録として記録する。

- 参考  
> - [https://blog.katsubemakito.net/articles/install_plantuml_for_ubuntu](https://blog.katsubemakito.net/articles/install_plantuml_for_ubuntu)
> - [https://qiita.com/valzer0/items/67a4c8bf2b1be0fc825a](https://qiita.com/valzer0/items/67a4c8bf2b1be0fc825a)
> - [新しいLinuxの教科書(SB Creativeのサイトに飛びます)](https://www.sbcr.jp/product/4797380941/)

# スクリプトリスト
## make_todo_index.sh
### 概要
日誌のはじめに書く行をクリップボードに入力する。

### 使い方
実行権限をつけて以下のように実行する
```
./make_md_index.sh xxx yyy zzz
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

