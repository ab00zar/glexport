class Shipment < ApplicationRecord
  belongs_to :company
  has_many :shipment_products, dependent: :destroy
  has_many :products, through: :shipment_products, dependent: :destroy
end
