#引数に与えられたURLが示すWebサイトのタイトルを取得する。
#nokogiriはgemからインストールする。
require 'net/http'
require 'uri'
require 'nokogiri'

# ARGV[0]はコマンドライン引数の１つ目。htmlを文字列として取得する。
html_file = Net::HTTP.get(URI.parse(ARGV[0]))
# Nokogiriを使ってhtmlをdomに変換する。
doc = Nokogiri::HTML.parse(html_file)
# domからtitleタグをとってきて、タグ内のhtmlを取得しターミナルに出力する。
print doc.at('title').inner_html