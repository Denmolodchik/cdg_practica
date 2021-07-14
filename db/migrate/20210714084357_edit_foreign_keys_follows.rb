class EditForeignKeysFollows < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :follows, column: :follower_id
    add_foreign_key :follows, :users, column: :follower_id, on_delete: :cascade, on_update: :cascade

    remove_foreign_key :follows, column: :following_id
    add_foreign_key :follows, :users, column: :following_id, on_delete: :cascade, on_update: :cascade
  end
end
