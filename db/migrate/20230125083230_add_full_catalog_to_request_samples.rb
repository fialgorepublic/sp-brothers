class AddFullCatalogToRequestSamples < ActiveRecord::Migration[6.1]
  def change
    add_column :request_samples, :full_catalog, :boolean, default: false
    remove_column :request_samples, :item_id, :integer
  end
end
