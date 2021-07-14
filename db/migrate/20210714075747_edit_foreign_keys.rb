class EditForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :likes, :users
    add_foreign_key :likes, :users, on_delete: :cascade, on_update: :cascade

    remove_foreign_key :likes, :posts
    add_foreign_key :likes, :posts, on_delete: :cascade, on_update: :cascade

    remove_foreign_key :posts, :users
    add_foreign_key :posts, :users, on_delete: :cascade, on_update: :cascade
  end
end
