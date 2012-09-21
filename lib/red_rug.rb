require 'redcarpet'

module RedRug
  def self.version; '0.2'; end

  def self.to_html(markdown_string)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(markdown_string)
  end

  def self.from_file(filename, output_format='html')
    case output_format
    when 'html'
      to_html(IO.read filename)
    end
  end
end
