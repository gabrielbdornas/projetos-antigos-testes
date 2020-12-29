class PagesController < ApplicationController

  class Mark < Redcarpet::Markdown

  end

  def home
    file = File.read('/home/gabrielbdornas/code/gabrielbdornas/ruby-para-iniciantes/source/01-preface.md')
    # file = Chapter.find(1)
    # kramdown
    @text = Kramdown::Document.new(file).to_html.html_safe
  end
end


