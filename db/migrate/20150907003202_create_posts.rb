class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :price
      t.text :body
      t.boolean :tjing

      t.timestamps null: false
    end
  end
end
