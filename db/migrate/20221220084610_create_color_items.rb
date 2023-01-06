class CreateColorItems < ActiveRecord::Migration[6.1]
  def change
    create_table :color_items do |t|
      t.integer :item_id
      t.integer :color_id

      t.timestamps
    end
  end
end
