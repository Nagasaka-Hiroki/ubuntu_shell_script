# shell scriptのtips

shell scripを作るときのメモ、試作やお試しなどを記録する。

---

## loop.sh
### 動作内容
無限ループのスクリプト。

### 参考URLメモ
- [https://webkaru.net/linux/sleep-command/](https://webkaru.net/linux/sleep-command/)

---

## httpに関するもの
### 動作内容
1. http_get.sh : URLを引数に渡して、指定URLのhtmlを取得する。
1. website_get.rb : rubyでwebサイトを取得する。

### サンプルサイト
　コマンドを作るとき外部サイトに頻繁にアクセスするのは良くないので、ローカル上でサイトを起動して試す。  
`sample_site`を作成し以下のコマンドを実行する。

```
mkdir sample_site
cd sample_site
jekyll new .
bundle exec jekyll serve
```

### website_get.rb
調べたところHTMLを解析するには`nokogiri`というgemを使うのがいいそうだ。参考を以下に示す。
- [Rubyでhtmlを整形したり、不要なタグを削除する](https://rooter.jp/web-crawling/ruby_html_disused_tags/)
- [スクレイピングエンジニアなら知っておきたいNokogiriの使い方8選](https://rooter.jp/web-crawling/scraping_with_nokogiri/)
- [Module: Nokogiri](https://www.rubydoc.info/gems/nokogiri/Nokogiri)

また、公式でチュートリアルがあった。
- [Nokogiri Tutorials](https://nokogiri.org/tutorials/toc.html)

コマンドでHTMLの解析はできなくはないが、上記のものを使ったほうが便利だと思う。

### 参考URL
- [curlコマンドでちょこっとHTTPリクエストを試すだけの記事](https://qiita.com/akane_kato/items/34b408336f4ec372b139)
- [httpbin.org](http://httpbin.org/#/)
- [curlコマンドでapiを叩く](https://qiita.com/buntafujikawa/items/758425773b2239feb9a7)
- [curl.1 the man page](https://curl.se/docs/manpage.html)

---

## whereami.sh
シェルスクリプト本体が書かれているパスを取得する。

自分で書いていたが、他にうまい書き方をしている人がいたので参考にする。以下参考。
- [[bash] 実行スクリプトの絶対パスの取得](https://qiita.com/koara-local/items/2d67c0964188bba39e29)

---

## path_to_link.sh
readlinkを使ったシンボリックリンクのリンク先のパスを取得する。

- [readlink(1)](https://ja.manpages.org/readlink)
- [readlinkコマンドが意外にすごい件について](https://tech.buty4649.net/entry/2014/03/25/readlink%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%8C%E6%84%8F%E5%A4%96%E3%81%AB%E3%81%99%E3%81%94%E3%81%84%E4%BB%B6%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)
- [readlink コマンド](https://hydrocul.github.io/wiki/commands/readlink.html)  

## prac_readlink.sh
　一つ前のリンクにもあったが、readlinkには絶対パスを取得する機能のあるそうだ。`man readlink`でも説明が見れるが日本語の方がわかりやすかったので以下に参考を示す。`-f`オプションが便利だと思った。`get_ref_md`はif文の練習を兼ねていたのでifを使ったが、`-f`を使えばif文も不要になりそうだ。

- [readlink コマンド – シンボリックリンクファイルや絶対パスのファイル名を表示 | Linuxコマンド.NET](https://linuxcommand.net/readlink/)
- [readlinkコマンドが意外にすごい件について](https://tech.buty4649.net/entry/2014/03/25/readlink%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%8C%E6%84%8F%E5%A4%96%E3%81%AB%E3%81%99%E3%81%94%E3%81%84%E4%BB%B6%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)

---

## make_tempfile.sh
一時ファイルに関する実験。以下参考。

- [/tmpディレクトリ - Linux技術者認定 LinuC｜LPI-Japan](https://linuc.org/study/knowledge/548/)

再起動すると消えるらしい。

---

## completion_test.sh
bashのtab補完。`bash-completion`というものでできるらしい。以下参考。

- [Bashタブ補完自作入門 - Cybozu Inside Out｜サイボウズエンジニアのブログ](https://blog.cybozu.io/entry/2016/09/26/080000)
- [Bash用の補完スクリプトの作り方 - Qiita](https://qiita.com/nil2/items/8a1544e206928c753a2e)

