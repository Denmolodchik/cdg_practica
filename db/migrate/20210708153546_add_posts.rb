class AddPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :user, foreign_key: true, on_delete: :cascade, on_update: :cascade

      t.timestamps
    end
  end
end
