class CreateShipmentProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :shipment_products do |t|
      t.integer :product_id
      t.integer :shipment_id
      t.integer :quantity

      t.timestamps
    end
  end
end
