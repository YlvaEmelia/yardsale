class AddIkeaUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :ikea_url, :string
  end
end
