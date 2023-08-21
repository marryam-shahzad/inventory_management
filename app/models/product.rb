# class Product < ApplicationRecord
#   has_many :product_stores
#   # has_many :stores, through: :product_stores
#   has_one_attached :image
#   has_many :prices
#   has_many :stores, through: :prices



# end


class Product < ApplicationRecord
  has_many :product_stores, dependent: :destroy
  has_many :stores, through: :product_stores
  has_many :prices, dependent: :destroy
  has_one_attached :image
  accepts_nested_attributes_for :product_stores
  has_many :quantities
  has_many :stores, through: :quantities
end