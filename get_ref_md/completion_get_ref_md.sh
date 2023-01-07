#!/bin/bash
_get_ref_md_bash_completion()
{
    #引数の数は一つでいい。
    if [ "${COMP_CWORD}" -le 1 ]; then
        #クリップボードの内容を引数に渡す。
        COMPREPLY=$(xclip -selection c -o)
    fi
}
#補完するコマンドを宣言する。
command_name="get_ref_md"
#補完するコマンドと関数を紐付ける。
complete -F _get_ref_md_bash_completion $command_name

#エイリアスからも呼び出せるようにする。
alias_name=$(grep $command_name ~/.bash_aliases | \
            sed -e "s/alias[ ]*\(.*\)=\"$command_name\"[ ]*/\1/g")
complete -F _get_ref_md_bash_completion $alias_name