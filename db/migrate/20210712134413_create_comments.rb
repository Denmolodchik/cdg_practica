class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :username
      t.text :body
      t.references :posts, foreign_key: true, on_delete: :cascade, on_update: :cascadec

      t.timestamps
    end
  end
end
