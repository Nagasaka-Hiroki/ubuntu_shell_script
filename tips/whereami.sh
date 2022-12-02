#!/bin/bash
iamhere=$(cd $(dirname $0); pwd)
echo $iamhere
echo "ルビーのスクリプトも実行できる"
ruby $iamhere/hello.rb