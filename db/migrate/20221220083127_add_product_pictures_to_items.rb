class AddProductPicturesToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :product_pictures, :json
  end
end
