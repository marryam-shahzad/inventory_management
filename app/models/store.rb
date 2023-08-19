class Store < ApplicationRecord
  # has_many :prices
  has_many :product_stores
  has_many :products, through: :product_stores
end
