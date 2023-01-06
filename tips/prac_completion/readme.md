# tabで補完
bashの入力を補助してくれる機能がどうなっているか？自分で作ったコマンドも補完したいと思ったので調べてみる。

## completion_test.sh
bashのtab補完。`bash-completion`というものでできるらしい。以下参考。

- [Bashタブ補完自作入門 - Cybozu Inside Out｜サイボウズエンジニアのブログ](https://blog.cybozu.io/entry/2016/09/26/080000)
- [Bash用の補完スクリプトの作り方 - Qiita](https://qiita.com/nil2/items/8a1544e206928c753a2e)
- [GitHub - scop/bash-completion: Programmable completion functions for bash](https://github.com/scop/bash-completion)
- [complete コマンド – 補完機能の設定を行う｜Linuxコマンド.NET](https://linuxcommand.net/complete/)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html#Programmable-Completion)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html#Programmable-Completion-Builtins)
- [bash-completion でコマンド補完を設定する｜miracleave Tech Blog](https://www.miracleave.co.jp/contents/1256/post-1256/)
- [bash-completionを活用して、manやhelpを見ずに、バシバシ長いコマンドを打つ - Qiita](https://qiita.com/yamada-hakase/items/bf163f0924e4d925fefb)
- [Ubuntu Manpage: ./siac-bash-completion - Creates bash completion file. ](https://manpages.ubuntu.com/manpages/jammy/man1/siac-bash-completion.1.html)
- [Programmable Completion (Bash Reference Manual)](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion.html)
- [いますぐ実践! Linuxシステム管理](http://www.usupi.org/sysad/235.html)
- [いますぐ実践! Linuxシステム管理](https://www.usupi.org/sysad/236.html)

インストールされているか確認。

```bash
type complete
complete はシェル組み込み関数です
```

疑問：compspec?

[Programmable Completion (Bash Reference Manual)](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion.html)が一次情報かつ短いだろうか？これをざっくりと読む。

また、Ubuntuのbashについては[Ubuntu Manpage: bash - GNU Bourne-Again SHell (la shell de Bourne otra vez, de GNU) ](https://manpages.ubuntu.com/manpages/jammy/es/man1/bash.1.html)のREADLINEの末尾に書かれていた。

自分の環境をまず調べる。以下のディレクトリに補完のスクリプトがあった。

1. `/etc/bash_completion.d`←ディレクトリ
1. `/etc/bash_completion`←ファイル（`/usr/share/bash-completion/bash-completion`を読み込む）
1. `/usr/share/bash-completion`←ディレクトリ
1. `/usr/share/bash-completion/completions`←ディレクトリ
1. `/usr/share/bash-completion/helpers`←ディレクトリ

内容が少し難しいので以下が簡単でわかりやすいのでまずそれを試す。
- [bash-completion でコマンド補完を設定する｜miracleave Tech Blog](https://www.miracleave.co.jp/contents/1256/post-1256/)

まずこれを実行するためにはなにかコマンドが必要らしい。そのためこのリポジトリの`get_domain_name`に対して補完を試す。

以下の動作をする。
```bash
$ get_domain_name
引数に以下のkeyのいずれかを入力してください。
[-------------------------------------------------------------]
[            key : value                                      ]
[-------------------------------------------------------------]
[         github : github.com                                 ]
[       gh_rails : github.com/rails                           ]
[            mdn : developer.mozilla.org/ja/docs              ]
[             js : developer.mozilla.org/ja/docs/Web/API      ]
[             es : jsprimer.net                               ]
[           ruby : docs.ruby-lang.org/ja/3.1                  ]
[    ruby_latest : docs.ruby-lang.org/ja/latest               ]
[          rails : api.rubyonrails.org/v7.0.4                 ]
[    rails_guide : railsguides.jp                             ]
[ rails_guide_en : guides.rubyonrails.org                     ]
[         docker : matsuand.github.io/docs.docker.jp.onthefly ]
[      docker_jp : docs.docker.jp                             ]
[          jammy : manpages.ubuntu.com/manpages/jammy         ]
[      man_linux : linuxjm.osdn.jp                            ]
[        man_git : git-scm.com/docs                           ]
[       git_book : git-scm.com/book/ja/v2                     ]
[-------------------------------------------------------------]
$ get_domain_name ruby
'site:docs.ruby-lang.org/ja/3.1' をクリップボードにコピーしました
```

引数に文字列を渡すが正確に入力するのが大変なものもある。そのためこのコマンドの引数を補完できたら便利である。

サンプルを作成して`/etc/bash_completion.d`にコピーする。

```bash
#!/bin/bash
_get_domain_name_bash_completion()
{
    echo "ruby"
}
complete -F _get_domain_name_bash_completion get_domain_name
```
これでtabを押すと`ruby`が出るようになった。しかし入力にはなっていないようだ。実行すると一覧が表示された。

続きをやる。`$3`を使う理由がよくわかっていないが、とりあえずやってみる。  
→OKとりあえずやった。わからないことが多いのでとりあえず以下も読む。

- [bash なんて書いたことない人が補完関数をとりあえず自作する - Qiita](https://qiita.com/sosuke/items/06b64068155ae4f8a853)
- [compgen コマンド – 補完の候補を表示する｜Linuxコマンド.NET](https://linuxcommand.net/compgen/)
- [コマンドの補完リストをgrepしたいときはcompgenを使うと便利 - Qiita](https://qiita.com/kawaz/items/7b9a58d633695bcc86cb)
- [【 compgen 】コマンド――bashの補完候補を生成する／使用できるコマンド名を一覧表示する](https://atmarkit.itmedia.co.jp/ait/articles/1907/18/news009.html)

とりあえず`compgen`がミソらしい。

---

小ネタ：  
`help`コマンドがあるらしい。ビルドインコマンドにはmanページがない。しかしそういう場合でもヘルプが見られるようだ。以下コマンド。

```bash
help help
help compgen
```

---

上記を参考に重要そうなのをまとめる。

|項目|コマンドor変数|結果と動作|
|-|-|-|
|使い方(例)|compgen -a c|cで始まるエイリアスを表示する。|
|Wオプション|compgen -W "a b c"|a b cを補完リストにする。|
|入力中の文字|COMP_WORDS[COMP_WORD]|入力中の文字が入っている|

- [Bashタブ補完自作入門 - Cybozu Inside Out｜サイボウズエンジニアのブログ](https://blog.cybozu.io/entry/2016/09/26/080000)

上記に`COMP_WORDS[COMP_WORD]`の説明がある。

補完した結果が使えた以下。

```bash
#!/bin/bash
_get_domain_name_bash_completion()
{
    arg="js"
    COMPREPLY=$arg
}
complete -F _get_domain_name_bash_completion get_domain_name
```

ちなみにスクリプトをわざわざ`/etc/bash_completion.d/`に配置しなくとも、その場で読み込む(`source`)ことで動く。

エイリアスでも動くようにする。sedコマンドでエイリアス名をとってくる。
- [【Shellスクリプト】文字列置換「bash」「sed」について！｜Beエンジニア](https://www.pmi-sfbac.org/string-replacement/)
- [sedチートシート - Qiita](https://qiita.com/yujiroarai/items/a8ee951d1f0e70abaefc)

とりあえず引数にjsを渡すスクリプトができたのでOKとする。

以下に示す。

```bash
#!/bin/bash
_get_domain_name_bash_completion()
{
    #引数の数は一つでいい。
    if [ "${COMP_CWORD}" -le 1 ]; then
        arg="js"
        COMPREPLY=$arg
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
```

一旦終了とする。