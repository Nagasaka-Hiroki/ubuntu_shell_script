#引数にサイト名を受け取って対応するドメインをターミナルに出力する
require_relative './domains'

#引数が空のときは入力を促し、一覧を表示する。
unless ARGV[0]
    puts "引数に以下のkeyのいずれかを入力してください。"
    DomainHolder.show_domains
    #シェルスクリプト側で補足するためにエラーで終了する
    #引数なしを1で返す。
    exit 1
end

#ARGVはfrozenとなっていて変更できない。そのため新しく文字変数を作る
#引数の文字列を小文字に変換し、シンボルに変換する。
site_domain=String.new ARGV[0]
key=site_domain.downcase.to_sym

#一致すればドメイン名、一致しなければ0を返すとする。
if result = DomainHolder.print_domain(key)
    puts result
else
    #シェルスクリプト側で補足するためにエラーで終了する
    #引数エラーを2で返す。
    exit 2
end