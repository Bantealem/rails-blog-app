class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :text
      t.integer :comments_counter
      t.string :likes_counter
      t.string :integer

      t.timestamps
    end
  end
end
