class CreateCartColors < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_colors do |t|
      t.integer :color_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
