class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :number
      t.string :name
      t.integer :price
      t.json :colors, default: {}
      t.boolean :active_item
      t.boolean :special_price_item, default: false

      t.timestamps
    end
  end
end
