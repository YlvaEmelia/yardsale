module Admin::PostsHelper
  
  def post_params
    params.require(:post).permit(:title, :body, :price, :tjing, images_files: [], :tag_list => [])
  end
  
end

