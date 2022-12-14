#!/bin/bash
#情報を入手するURLを表示
echo $1

#シェルスクリプトが存在するパスを取得する。
if readlink $0 > /dev/null 2>&1 ; then
    #シンボリックリンクの場合、リンク先を取得
    dir_path=$(readlink $0)
    dir_path=$(dirname $dir_path)
else
    #そうでない場合は普通にパスを取得
    dir_path=$(cd $(dirname $0); pwd)
fi

#Rubyプログラムを実行
#Webサイトのタイトルを文字列として取得
res=$(ruby $dir_path/get_ref.rb $1) 

#取得した情報をマークダウン形式にする。
res="["$res"]("$1")"

#取得内容を表示
echo $res
#クリップボードにコピー
echo $res | xclip -selection clipboard