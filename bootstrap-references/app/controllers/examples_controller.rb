class ExamplesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_example, only: [:show, :edit, :update, :destroy]

  def home
    @examples = Example.all
  end

  def show
  end

  def new
    @page = Page.find(params[:page_id])
    @example = Example.new
  end

  def create
    page = Page.find(params[:page_id])
    @example = Example.new(example_params)
    @example.page = page
    @example.save
    @example.partial = "#{@example.page.id}#{@example.id}_#{@example.example_topic.downcase.split.join('_')}"
    @example.save
    File.new("app/views/examples/examples_pages/_#{@example.partial}.html.erb", "w")
    redirect_to page_path(page)
  end

  def edit
  end

  def update
    @example.update(example_params)
    redirect_to page_path(@example.page)
  end

  def destroy
    @example.destroy
    File.delete("app/views/examples/examples_pages/_#{@example.partial}.html.erb")
    redirect_to page_path(@example.page)
  end

  private

  def set_example
    @example = Example.find(params[:id])
  end

  def example_params
    params.require(:example).permit(:page_id, :example_topic, :content)
  end
end
