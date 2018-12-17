class ShipmentProduct < ApplicationRecord
  belongs_to :shipment, :product
end
