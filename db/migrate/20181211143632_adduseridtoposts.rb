class Adduseridtoposts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :integer, default: 1
    add_column :users, :admin, :boolean, default: false
  end
end
