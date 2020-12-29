class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_page, only: [:show]

  def home
    @pages = Page.all
  end

  def show
    @examples = Example.where(page: @page)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.save
    redirect_to root_path
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:page_topic, :content, :you_tube_link)
  end
end
