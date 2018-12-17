class Company < ApplicationRecord
  has_many :products, :shipments, dependent: :destroy
end
