#!/bin/bash
#情報を入手するURLを表示
echo $1

#Rubyプログラムを実行
#Webサイトのタイトルを文字列として取得
res=$(ruby get_ref.rb $1) 

#取得した情報をマークダウン形式にする。
res="["$res"]("$1")"

#取得内容を表示
echo $res
#クリップボードにコピー
echo $res | xclip -selection clipboard