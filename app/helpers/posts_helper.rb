module PostsHelper
  def post_params
    params.require(:post).permit(:title, :body, :price, :tjing, 
      :ikea_url, images_files: [], :tag_list => [])
  end
  
  def tag_cloud(tags)
    max = tags.sort_by(&:count).last
        tags.each do |tag|
      index = tag.count.to_f
      yield(tag)
    end
  end
  
end
