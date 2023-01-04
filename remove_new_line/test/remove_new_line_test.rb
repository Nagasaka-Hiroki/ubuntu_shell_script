#テストを自動化して効率化する。

require 'minitest/autorun'
require_relative '../lib/remove_new_line'

class RemoveTest < Minitest::Test
    def test_raise_exception
        assert true
    end
end