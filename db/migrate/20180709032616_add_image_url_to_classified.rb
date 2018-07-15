class AddImageUrlToClassified < ActiveRecord::Migration[5.0]
  def change
    add_column :classifieds, :image_url, :string
  end
end
