class EditForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :comments, :posts
    add_foreign_key :comments, :posts, on_delete: :cascade, on_update: :cascade
  end
end
