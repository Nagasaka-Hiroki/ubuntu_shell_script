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

