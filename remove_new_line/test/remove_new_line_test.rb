#テストを自動化して効率化する。
require 'minitest/autorun'

#モジュールを読み込んで、モジュールの機能をテストする。
require_relative '../lib/replace_new_line'

#クラス内でincludeするとクラス内で定義されたメソッドになる。
include Replacement #クラスの外でinclude

class FileOpenTest < Minitest::Test
    #ファイルを空にする。
    def setup
        Replacement.inputfile = nil
        Replacement.input_text = ""
    end
    #モジュールでファイルを開く
    def test_file_open
        correct_file_path = File.dirname(File.expand_path(__FILE__))+"/testfile.txt"
        file=Replacement.open_input_file(correct_file_path)
        assert_instance_of File, file, "Fileクラスのインスタンスではありません。"
    end

    #間違ったファイル名を指定して失敗させる。
    def test_raise_exception
        wrong_file_path=File.dirname(File.expand_path(__FILE__))+"/wrong_file_name.txt"
        assert_raises(Errno::ENOENT) do
            Replacement.open_input_file(wrong_file_path)
        end
    end
    #空のファイルを渡す。
    def test_read_empty_file
        empty_file_path = File.dirname(File.expand_path(__FILE__))+"/empty_file.txt"
        file = Replacement.open_input_file(empty_file_path)
        #ファイルの中身がない状態でファイルを読み込む。
        #中身がないファイルを読み込んで配列を全部つなげると、""となるはず。
        assert_equal Replacement.read_input_file, ""
    end
    #ファイルがnilのとき読み込み動作は""のはず
    def test_nil_file
        assert_equal Replacement.read_input_file, ""
    end
end

class RemoveTest < Minitest::Test
    #ファイルを開く。開く挙動はclass FileOpenTest で確認。
    def setup
        #ヒアドキュメントで入力内容を作ったほうがメソッドの挙動がわかりやすい。
        @input_text =<<~EOL
        this is 
        a test.
        this line is
        the second line.
        this line has many spaces       .
        EOL
        Replacement.input_text = @input_text
    end
    
    #モジュールのメソッドでファイルの内容を読み込む。
    #読み込んだテキストはすべて連結し一つの変数にする。
    def test_read_text
        assert_equal Replacement.read_input_file, 
        "this is \na test.\nthis line is\nthe second line.\nthis line has many spaces       .\n"
    end
    #置換をする。
    def test_replacement
        assert_equal Replacement.replace_input_text, 
        "this is a test.\n\nthis line is the second line.\n\nthis line has many spaces."
    end
end
