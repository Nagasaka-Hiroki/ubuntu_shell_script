#改行を取り除く。

require_relative '../lib/replace_new_line'

#モジュールをインクルードして使用する。
include Replacement

#ファイルを開き、テキストから改行を除外。一文づつに分解する。
begin
    #引数に渡したファイルを開いてテキストを読み込む。
    Replacement.read_input_file(ARGV[0])
    #置換を行う。
    replaced_text = Replacement.replace_input_text
    unless replaced_text.length.eql?(0)
        #標準出力に書き出す。
        puts replaced_text
    else
        puts "ファイルの中身が空です。"
        exit 1
    end
rescue Errno::ENOENT, TypeError
    puts "ファイルが指定されていないか、指定したファイルが存在しません。"
    exit 1
end