class AddUserRefPosts < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :posts, :users
    remove_column :posts, :user_id, :integer
    add_reference :posts, :user, foreign_key: true, on_delete: :cascade
  end
end
