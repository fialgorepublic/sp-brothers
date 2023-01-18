class CreateRequestSamples < ActiveRecord::Migration[6.1]
  def change
    create_table :request_samples do |t|
      t.string :full_name
      t.string :mobile_no
      t.string :email
      t.string :business_name
      t.string :address
      t.integer :item_id

      t.timestamps
    end
  end
end
