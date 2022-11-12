# Shell Script
Ubuntuを便利に使うためのshell scriptを作っていく。

分散すると厄介なのでここにまとめておいて管理する。

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

