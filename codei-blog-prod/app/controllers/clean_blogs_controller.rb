class CleanBlogsController < ApplicationController
	require 'open-uri'
  require 'nokogiri'
  require 'httparty'
  layout "clean_blog"

	def index
    # Para baixar repositório aonde .md estão
    # system 'rm -rf codei-blog-posts'
    # system 'git clone git@github.com:gabrielbdornas/codei-blog-posts.git'
    # system 'cd codei-blog-posts && rm -rf .git'
    # data_scraping
    # @posts = []
    # post_info = {}
    # @posts_content.each do |post|
    #   line = 1
    #   CSV.foreach("#{post}", encoding:'utf-8', liberal_parsing: true) do |row|
    #     raise
    #     if line >=1 && line < 5 && row != nil && row.join.split(":")[1].strip != nil
    #       row_info = row.join.split(":")[1].strip
    #       post_info[:name] = row_info if line == 1
    #       post_info[:author] = row_info if line == 2
    #       post_info[:reading_time] = row_info if line == 3
    #       post_info[:resume] = row_info if line == 4
    #       post_info[:github_link] = ""
    #     end
    #     line += 1
    #   end
    # end
    Post.delete_all
    all_text_files = Dir.glob "posts/*.md"
    all_text_files.sort.each do |file|
      line = 1
      post = {}
      # https://ruby-doc.org/core-2.5.0/File.html - Buscar data atualização arquivo
      # post[:md_editing_date] = File.ctime("#{file}")
      # https://stackoverflow.com/questions/9864064/csv-read-illegal-quoting-in-line-x - corrigir problema de cotes
      CSV.foreach("#{file}", encoding:'utf-8', liberal_parsing: true) do |row|
        if line == 1
          post[:name] = row.join.split(":")[1].strip
        end
        line += 1
      end
      Post.create(post)
    end
  end

  def data_scraping
    @posts_content = []
    url = "https://github.com/gabrielbdornas/codei-blog-posts"
    git_hub = "https://raw.githubusercontent.com/gabrielbdornas/codei-blog-posts/2b4e0fa4ff2878050848470cb0d569de090c3c64/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    file_text = parsed_page.css('a.js-navigation-open.link-gray-dark')
    file_text.to_a.each do |file|
      # open('article.md', 'wb') do |open|
      #   post = open("#{git_hub}#{file.text}").read
      #   @posts_content << post
      # end
      data = File.read("#{git_hub}#{file.text}")
      html = RDoc::Markdown.parse(data).accept(formatter)
      raise
    end
    @posts_content
  end

  def about
	end

	def post
    @teste = ''
    url = "https://github.com/gabrielbdornas/codei-blog-posts"
    git_hub = "https://raw.githubusercontent.com/gabrielbdornas/codei-blog-posts/2b4e0fa4ff2878050848470cb0d569de090c3c64/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    # raw = parsed_page.css('a.js-navigation-open.link-gray-dark').first.attr('href')
    file_text = parsed_page.css('a.js-navigation-open.link-gray-dark').first.text
    open('article.md', 'wb') do |file|
      @teste << open("#{git_hub}#{file_text}").read
    end
	end

	def contact
	end

  def abrir
    require 'json'
    require 'open-uri'
    result = JSON.parse open('https://github.com/gabrielbdornas/ruby-for-beginners/blob/main/source/10-writing_methods/02-definition.md').read
    raise
  end
end

# require 'csv'
#   skip_before_action :authenticate_user!, only: [ :index, :update_all ]

#   def index
#     @posts = policy_scope(Post)
#     render json: @posts
#   end

#   def update_all
#     Post.delete_all
#     all_text_files = Dir.glob "db/posts_sources/*.md"
#     all_text_files.sort.each do |file|
#       line = 1
#       post = {}
#       resume = []
#       content = []
#       # https://ruby-doc.org/core-2.5.0/File.html - Buscar data atualização arquivo
#       post[:md_editing_date] = File.ctime("#{file}")
#       # https://stackoverflow.com/questions/9864064/csv-read-illegal-quoting-in-line-x - corrigir problema de cotes
#       CSV.foreach("#{file}", encoding:'utf-8', liberal_parsing: true) do |row|
#         if line >=1 && line < 5 && row != nil && row.join.split(":")[1].strip != nil
#           row_info = row.join.split(":")[1].strip
#           post[:name] = row_info if line == 1
#           post[:author] = row_info if line == 2
#           post[:reading_time] = row_info if line == 3
#           post[:resume] = row_info if line == 4
#           post[:github_link] = "https://github.com/gabrielbdornas/codei-blog-posts-api/blob/master/#{file}"
#         elsif line > 9
#           content << row
#         end
#         line += 1
#       end
#       post[:content] = content.join("")
#       Post.create(post)
#     end
#   end
