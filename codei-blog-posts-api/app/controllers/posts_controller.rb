class PostsController < ApplicationController
  require 'csv'
  skip_before_action :authenticate_user!, only: [ :index, :update ]

  def index
    update
    @posts = Post.all
  end

  def update_all
    Post.delete_all
    all_text_files = Dir.glob "db/posts_sources/*.md"
    raise
    all_text_files.each do |file|
      line = 1
      post = {}
      resume = []
      content = []
      # https://ruby-doc.org/core-2.5.0/File.html - Buscar data atualização arquivo
      post[:md_editing_date] = File.ctime("#{file}")
      # https://stackoverflow.com/questions/9864064/csv-read-illegal-quoting-in-line-x - corrigir problema de cotes
      CSV.foreach("#{file}", encoding:'utf-8', liberal_parsing: true) do |row|
        if line >=1 && line < 5 && row != nil && row.join.split(":")[1].strip != nil
          row_info = row.join.split(":")[1].strip
          post[:name] = row_info if line == 1
          post[:author] = row_info if line == 2
          post[:reading_time] = row_info if line == 3
          post[:resume] = row_info if line == 4
          post[:github_link] = "https://github.com/gabrielbdornas/codei-blog-posts-api/blob/master/#{file}"
        elsif line > 9
          content << row
        end
        line += 1
      end
      post[:content] = content.join("")
      Post.create(post)
    end
  end
end
