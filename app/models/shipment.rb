class Shipment < ApplicationRecord
  include Questionable
  
  belongs_to :company
  has_many :shipment_products, dependent: :destroy
  has_many :products, through: :shipment_products, dependent: :destroy

  scope :company_id, -> company_id { where(company_id: company_id) }
  scope :sorting, -> (field,direction) { order(sort_command(field,direction)) }
  scope :international_transportation_mode, -> mode { where(international_transportation_mode: mode) }


  #This method generates the sort command using params to be used by order
  def self.sort_command(field, direction)
    field = field.blank? ? 'id' : field
    direction = direction.blank? ? 'ASC' : direction
    "#{field} #{direction}"
  end

end
