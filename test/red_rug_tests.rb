require 'minitest/autorun'
require '../lib/red_rug'

class RedRugTests < MiniTest::Test
  def setup
    @html_string = "<em>one</em> is too many"
    @unescaped_string = "<p><em>one</em> is too many</p>\n"
    @escaped_string = "<p>&lt;em&gt;one&lt;/em&gt; is too many</p>\n"
  end

  def test_to_html_correct
    assert_equal "<h1>foo</h1>\n", RedRug.to_html('#foo')
  end

  def test_from_file_default_correct
    assert_equal "<h1>foo</h1>\n", RedRug.from_file('data/simple.md')
  end

  def test_from_file_to_html_correct
    assert_equal "<h1>foo</h1>\n", RedRug.from_file('data/simple.md', 'html')
  end

  def test_no_html_escape
    assert_equal @unescaped_string, RedRug.to_html(@html_string)
  end

  def test_html_escape
    options = { escape_html: true }
    assert_equal(
      @escaped_string,
      RedRug.to_html(@html_string, options)
    )
  end
end
