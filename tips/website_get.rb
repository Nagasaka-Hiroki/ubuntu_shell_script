require 'net/http'
require 'uri'
require 'nokogiri'
# jekyll serverを起動して得られるURLから取得。
# ARGV[0]はコマンドライン引数の１つ目
html_file = Net::HTTP.get(URI.parse(ARGV[0]))
doc = Nokogiri::HTML.parse(html_file)
print doc.at('title').inner_html