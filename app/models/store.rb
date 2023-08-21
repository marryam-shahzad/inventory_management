class Store < ApplicationRecord
  # has_many :prices
  # has_many :product_stores
  has_many :products, through: :product_stores
  has_many :prices
  has_many :products, through: :prices
  has_many :product_stores, dependent: :destroy
   has_many :quantities
  has_many :products, through: :quantities
end
