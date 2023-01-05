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
touch $FILE_PATH #一度作成しないと正しく失敗しなかった。
vim $FILE_PATH

# :wqで終了した場合ファイルが作成される。 :qで終了した場合ファイルは作成されない。
if [ -f "$FILE_PATH" ]; then
    result=$(ruby $PATH2SCRIPT$RUBY_SCRIPT $FILE_PATH)
fi
#ステータスを消えないように保存
status=$?

#ステータスに合わせて挙動を変える。
case "$status" in
    0) #正常に終了した場合は結果をクリップボードに貼り付ける。
        echo "$result" | xclip -selection clipboard
        echo "クリップボードに貼り付けました。"
        ;;
    1) #例外を出して失敗した場合はエラー文を出して終了。
        echo "$result"
        ;;
esac