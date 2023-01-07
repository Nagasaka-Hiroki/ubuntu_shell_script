#!/bin/bash
_get_domain_name_bash_completion()
{
    #引数の数は一つでいい。
    if [ "${COMP_CWORD}" -le 1 ]; then
        #スクリプトまでのパスを取得する。
        local path2script=$(dirname $(readlink -f "$(which $command_name)"))
        #rubyスクリプトを実行して補完候補一覧を取得する。
        local key_list=$(ruby $path2script/completion_get_domain_name.rb)
        #現在の入力を取得。
        local current_input=${COMP_WORDS[COMP_CWORD]}
        #現在の入力にマッチするリスト一覧を取得し、一覧に表示。
        COMPREPLY=($(compgen -W "$key_list" -- "$current_input"))
    fi
}
#補完するコマンドを宣言する。
command_name="get_domain_name"
#補完するコマンドと関数を紐付ける。
complete -F _get_domain_name_bash_completion $command_name

#エイリアスからも呼び出せるようにする。
alias_name=$(grep $command_name ~/.bash_aliases | \
            sed -e "s/alias[ ]*\(.*\)=\"$command_name\"[ ]*/\1/g")
complete -F _get_domain_name_bash_completion $alias_name