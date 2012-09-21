require 'test/unit'
require '../lib/red_rug'

class RedRugTests < Test::Unit::TestCase
  def test_to_html_correct
    assert_equal "<h1>foo</h1>\n", RedRug.to_html('#foo')
  end
end
