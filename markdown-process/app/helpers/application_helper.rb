module ApplicationHelper
  def markdown_converter(text)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(text)
  end
end
