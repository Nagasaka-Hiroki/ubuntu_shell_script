#改行を置換するためのメソッドをまとめる。

module Replacement
    #ファイルを開く
    def open_input_file(file_name=nil)
        @inputfile=File.open(file_name)
    end
    #ファイルの内容を読み込む。
    def read_input_file
        @input_text=@inputfile&.readlines
    end
end