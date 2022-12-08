class RemoveIntegerFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :integer, :string
  end
end
