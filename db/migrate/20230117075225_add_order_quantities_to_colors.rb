class AddOrderQuantitiesToColors < ActiveRecord::Migration[6.1]
  def change
    add_column :colors, :order_quantities, :integer
  end
end
