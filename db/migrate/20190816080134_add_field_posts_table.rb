class AddFieldPostsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :score, :integer
  end
end
