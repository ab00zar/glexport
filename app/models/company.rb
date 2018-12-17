class Company < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :shipments, dependent: :destroy
end
