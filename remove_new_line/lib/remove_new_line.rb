#ファイルを開く。
#input=FILE.open(ARGV[0])

require_relative '../lib/replace_new_line'

#Objectにinclude
include Replacement

#ファイルを開き、テキストから改行を除外。一文づつに分解する。
begin
    #入力が正しいか確認する。
    Replacement.open_input_file(ARGV[0])
rescue Errno::ENOENT
    
end