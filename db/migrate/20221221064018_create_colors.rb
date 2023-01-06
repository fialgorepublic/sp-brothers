class CreateColors < ActiveRecord::Migration[6.1]
  def change
    create_table :colors do |t|
      t.string :code
      t.string :quantities
      t.date :available_date
      t.json :pictures

      t.timestamps
    end
  end
end
