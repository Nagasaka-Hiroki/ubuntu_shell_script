#!/bin/bash
#このスクリプトのパスを取得
iamhere=$(cd $(dirname $0); pwd)

#ファイルを作成
echo "a" > a
#リンクを作成
ln -s $iamhere/a $iamhere/b

#readlinkのテスト
readlink -v a
readlink -v b

path_to_b=$(readlink b)
echo `dirname $path_to_b`