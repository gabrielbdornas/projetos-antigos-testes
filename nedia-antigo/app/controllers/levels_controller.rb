class LevelsController < ApplicationController

  def index_search
    @levels_search = []
    levels = Level.where(sub_category: SubCategory.where(name: params[:sub_category]))
    levels.each do |level|
      @levels_search << level.name
    end
  end
end
