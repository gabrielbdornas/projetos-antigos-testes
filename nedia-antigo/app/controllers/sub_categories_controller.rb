class SubCategoriesController < ApplicationController

  def index_search
    @sub_categories_search = []
    sub_category_search = SubCategory.where(category: Category.where(name: params[:category]))
    sub_category_search.each do |sub_category|
      @sub_categories_search << sub_category.name
    end
  end
end
