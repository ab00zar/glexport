class Shipment < ApplicationRecord
  belongs_to :company
  has_many :shipment_products, dependent: :destroy
  has_many :products, through: :shipment_products, dependent: :destroy

  scope :sorting, -> (field,direction) {order(sort_command(field,direction))}
  scope :filters, -> (mode) {where(international_transportation_mode: mode)}
  scope :pagination, ->(page, per) {page(page).per(per)}


  def self.sort_command(field, direction)
    field = field.blank? ? 'id' : field
    direction = direction.blank? ? 'ASC' : direction
    "#{field} #{direction}"
  end

end
