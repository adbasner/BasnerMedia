class ChangeNameOfArtidTopostid < ActiveRecord::Migration[5.2]
  def change
    rename_column :article_categories, :article_id, :post_id
  end
end
