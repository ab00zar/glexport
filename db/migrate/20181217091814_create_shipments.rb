class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :name
      t.integer :company_id
      t.string :international_transportation_mode
      t.date :international_departure_date

      t.timestamps
    end
  end
end
