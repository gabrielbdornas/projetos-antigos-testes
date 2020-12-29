class CategoriesController < ApplicationController

  def index
    @categories_search = []
    categories = Category.all
    categories.each do |category|
      @categories_search << category.name
    end
  end
end
