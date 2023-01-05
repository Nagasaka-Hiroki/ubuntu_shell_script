#改行を置換するためのメソッドをまとめる。

module Replacement
    #クラスインスタンス変数を定義
    #文字列を初期化
    @input_text=""
    #アクセスできるように設定。
    attr_accessor :input_text

    #ファイルを開く部分と統合。ブロックで読み込む。
    #ファイルの内容を読み込み変数として保存、そして返り値に設定。
    def read_input_file(file_name=nil)
        #ブロックでファイルの読み込みをする。
        input_text = File.open(file_name) do |f|
            #ファイルを読み込む
            input_text=f.readlines
            next input_text
        end
        #文字列を連結する
        input_text&.each do |value|
            @input_text += value
        end
        #結果を返す。モジュール内にも状態を保存する。
        @input_text
    end
    #読み込んだ結果を置換する。
    def replace_input_text
        #改行をすべてスペースにする。
        @input_text.gsub!(%r{[\s]+}, " ")
        #ピリオド＋空白はピリオド+改行に
        @input_text.gsub!(%r{\.[\s]+?}, ".\n")
        #スペースとピリオドはピリオドに変換
        @input_text.gsub!(%r{[\s]+?\.}, ".")
        #改行で配列に分割、改行２つを間に差し込んで連結。
        @input_text = @input_text.split(%r{\n}).join("\n\n")
    end
end