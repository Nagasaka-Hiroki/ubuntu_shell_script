#!/bin/bash

#シンボリックリンクであるかに関わらず、スクリプト本体のディレクトリの絶対パスを取得する。
PATH2SCRIPT=$(dirname $(readlink -f $0))

#変数を宣言
DIR_PATH="/tmp/remove_new_line"
FILE_NAME="input_text"
FILE_PATH=$DIR_PATH"/"$FILE_NAME
RUBY_SCRIPT="/lib/remove_new_line.rb"

#ディレクトリを作成。
mkdir -p $DIR_PATH
#前に実行して作成したファイルを削除する。
rm $FILE_PATH > /dev/null 2>&1
#エディタを起動してテキストを入力する。
vim $FILE_PATH

# :wqで終了した場合ファイルが作成される。 :qで終了した場合ファイルは作成されない。
if [ -f "$FILE_PATH" ]; then
    ruby $PATH2SCRIPT$RUBY_SCRIPT $FILE_PATH
fi