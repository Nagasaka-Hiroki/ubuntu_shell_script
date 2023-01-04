# get_domain_name.sh

追記を書くとトップページを圧迫するので追記を移動する。

以下に移動する。

## 追記
以下のjavascriptのリファレンスを追加。`js`で呼び出せる。
- [Web API｜MDN](https://developer.mozilla.org/ja/docs/Web/API)

javascriptのリファレンスを追加。`es`で呼び出せる。
- [JavaScript Primer - 迷わないための入門書 #jsprimer](https://jsprimer.net/)

githubのruby on railsのサイトを追加。`gh_rails`で呼び出せる。
- [Ruby on Rails · GitHub](https://github.com/rails)

dockerのサイトを追加。`docker`で呼び出す。
- [Docker Documentation](https://docs.docker.com/)  
追記：以下のURLに差し替え。
- [Docker ドキュメント](https://matsuand.github.io/docs.docker.jp.onthefly/)

dockerの日本語リファレンスを追加。`docker_jp`で呼び出す。
- [Docker ドキュメント日本語化プロジェクト — Docker-docs-ja 20.10 ドキュメント](https://docs.docker.jp/)

Ubuntuマニュアルのリンクを追加。`jammy`で呼び出す。バージョンはUbuntu 22.04を指定している。
- [Ubuntu Manpage: Directory Listing ](https://manpages.ubuntu.com/manpages/jammy/)

Linux全般のコマンドのリファレンス。`man_linux`で呼び出す。Ubutnu特有の動作は上記のUbuntuマニュアルを参照すると上手く行くかもしれない。
- [JM Project (Japanese)](https://linuxjm.osdn.jp/)

修正： 一覧表示を整形。  
修正： 一覧表示をもう少し修正。

Gitコマンドのリファレンスを追加。`man_git`で呼び出す。
- [Git - Reference](https://git-scm.com/docs)
Git Bookから調べる場合は、`git_book`と入力する。
- [Git - Book](https://git-scm.com/book/ja/v2)

railsのURLをバージョン7.0.4(作成時の最新安定版)に固定
- [Ruby on Rails API](https://api.rubyonrails.org/v7.0.4/)

## 挙動の確認
　使い続けるといくつか動作が上手く行かないパターンがある。例えば次のパターン

- ステータスコード3XXの場合、タイトルがステータスコードになる（記憶が曖昧だが、少なくともタイトルが入らない）
- 例えば次のURL：https://www.ipa.go.jp/security/awareness/vendor/programmingv2/web09.html  
エラーの内容は以下。
```
`connect_nonblock': SSL_connect returned=1 errno=0 peeraddr=192.218.88.180:443 state=error: unsafe legacy renegotiation disabled (OpenSSL::SSL::SSLError)
```
-  次のURLから取得すると文字化けする。  
https://e-words.jp/w/WebSocket.html

現状これらは問題が生じた場合に手動で取得している。ケースとしては少ないので対応はまた別の機会にする。