#!/bin/bash
#シンボリックリンクであるかに関わらず、スクリプト本体のディレクトリの絶対パスを取得する。
path2script=$(dirname $(readlink -f $0))

#rubyスクリプトを引数を指定して実行する
#引数がないときは一覧が出る。ステータスは1が返る
#引数があるときは１つ目を使用してコマンドを実行する。
#一致すればステータスは0、しなければ2が返る。
#result="$(ruby $path2script/print_domain.rb $1)"
result=$(ruby $path2script/print_domain.rb $1)
#ステータスを消えないように保存
status=$?

#ステータスに合わせて挙動を変える。
case "$status" in
    0) #正常に終了した場合は先頭に site: をつけて返す。
        echo "site:"$result" " | xclip -selection clipboard
        echo "'site:"$result"' をクリップボードにコピーしました"
        ;;
    1) #引数がないときは一覧が返る。
        echo "$result"
        ;;
    2) #引数に一致するドメインがないときはエラーを出力する。
        echo "入力したキーに対応するドメインがありません"
        echo "引数なしで実行すればドメインの一覧が出ます"
        ;;
esac