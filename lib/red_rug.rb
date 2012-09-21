require 'redcarpet'

module RedRug
  def self.version; '0.1'; end

  def self.to_html(mstring)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(mstring)
  end
end
