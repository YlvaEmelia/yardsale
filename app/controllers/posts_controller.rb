class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    if params[:tag]
        @posts = Post.tagged_with(params[:tag])
      else
        @posts = Post.all
      end
  end

  def show
  end


  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :price, :tjing,
      :ikea_url, images_files: [], :tag_list => [])
  end
end
