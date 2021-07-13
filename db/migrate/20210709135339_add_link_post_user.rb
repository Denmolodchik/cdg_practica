class AddLinkPostUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :post, :user, foreign_key: true
  end
end
