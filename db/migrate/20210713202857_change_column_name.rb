class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :users_id, :user_id
    rename_column :likes, :posts_id, :post_id
  end
end
