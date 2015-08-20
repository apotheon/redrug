require 'redcarpet'
require 'versionize'

=begin rdoc

RedRug provides a simplified interface to the functionality of the Redcarpet
gem for Markdown handling, intended to provide convenience in execution of
common tasks.  At present, only HTML output is supported.

To begin using RedRug in your code, require it.  Example:

        require 'red_rug'

=end

module RedRug
  include Versionize
  @version = {
    :major      =>  0,
    :minor      =>  3,
    :revision   =>  0
  }

=begin rdoc

The +markdown_string+ argument is a string containing text using Markdown
formatting recognized by Redcarpet.  The method returns an HTML formatted
version of the string.  It depends on the Redcarpet implementation, which adds
a newline at the end of the output string.

Example:

        RedRug.to_html('#foo')
        => "<h1>foo</h1>\n"

=end

  def self.to_html(markdown_string, options=Hash.new)
    unless options.has_key? :escape_html
      options[:escape_html] = false
    end

    markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML.new(options)
    markdown.render(markdown_string)
  end

=begin rdoc

The +filename+ argument is a string consisting of the name of a file, including
path information as necessary.

The +output_format+ argument is an output format supported by RedRug via +to_*+
methods, indicated in lower case letters.  When no +output_format+ is
specified, it defaults to HTML.

Example, assuming a file +file.md+ containing only +#foo+ on the first line:

        RedRug.from_file('/usr/home/username/file.md', 'html')
        => "<h1>foo</h1>\n"

It depends on the implementation of the +to_*+ method it calls.

=end

  def self.from_file(filename, output_format='html')
    case output_format
    when 'html'
      to_html(IO.read filename)
    end
  end
end
