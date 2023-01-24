class CreateContactSupports < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_supports do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :message
      t.timestamps
    end
  end
end
