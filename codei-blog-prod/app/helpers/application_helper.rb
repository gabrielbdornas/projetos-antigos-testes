module ApplicationHelper

  def markdown(text)
    options = [:fenced_code_blocks, :smartypants, :no_intra_emphasis, :autolink, :strikethrough, :tables]
    Markdown.new(text, *options).to_html.html_safe
  end
  require 'rubygems'
end
