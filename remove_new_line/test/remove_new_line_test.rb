#テストを自動化して効率化する。
require 'minitest/autorun'

#モジュールを読み込んで、モジュールの機能をテストする。
require_relative '../lib/replace_new_line'

#クラス内でincludeするとクラス内で定義されたメソッドになる。
include Replacement #クラスの外でinclude

class FileOpenTest < Minitest::Test
    #モジュールでファイルを開く
    def test_file_open
        correct_file_name = File.dirname(File.expand_path(__FILE__))+"/testfile.txt"
        file=Replacement.open_input_file(correct_file_name)
        assert_instance_of File, file, "Fileクラスのインスタンスではありません。"
    end

    #間違ったファイル名を指定して失敗させる。
    def test_raise_exception
        wrong_file_name=File.dirname(File.expand_path(__FILE__))+"/wrong_file_name.txt"
        assert_raises(Errno::ENOENT) do
            Replacement.open_input_file(wrong_file_name)
        end
    end
end

class RemoveTest < Minitest::Test
    #ファイルを開く。開く挙動はclass FileOpenTest で確認。
    def setup
        @file_name = File.dirname(File.expand_path(__FILE__))+"/testfile.txt"
        @file=Replacement.open_input_file(@file_name)
    end
    
    #モジュールのメソッドでファイルの内容を読み込む。
    def test_read_text
        p Replacement.read_input_file
    end
end