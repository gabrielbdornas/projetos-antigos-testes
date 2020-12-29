class SuppliesController < ApplicationController
  def new
    @supply = Supply.new
    @itens_siad_code = []
    Iten.all.each do |iten|
      @itens_siad_code << iten.siad_code
    end
    # @itens = Iten.all.to_a
  end

  def create
    @supply = Supply.new(supply_params)
    @supply.user = current_user
    if @supply.save
      redirect_to new_supplies_path
    else
      render :new
    end
  end

  private

  def supply_params
    params.require(:supply).permit(:iten_id)
  end

end


# class PostsController < ApplicationController

#   skip_before_action :authenticate_user!, only: [ :index, :show ]
#   before_action :set_post, only: [ :show, :edit, :update, :destroy ]

#   def index
#     @posts = Post.where(draft: false)
#   end

#   def show
#   end

#   def new
#     @post = Post.new
#   end

#   def create
#     @post = Post.new(post_params)
#     @post.user = current_user
#     if @post.save
#       redirect_to post_path(@post)
#     else
#       render :new
#     end
#   end

#   def edit
#   end

#   def update
#     if @post.update(post_params)
#       render :show
#     else
#       render_error
#     end
#   end

#   def destroy
#     @post.destroy
#     redirect_to posts_path
#   end

#   private

#   def set_post
#     @post = Post.find(params[:id]) if Post.where(id: params[:id]).count != 0
#   end

#
# end
