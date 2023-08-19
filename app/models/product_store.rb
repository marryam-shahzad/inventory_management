class ProductStore < ApplicationRecord
  belongs_to :product
  belongs_to :store
  # validates :price, presence: true
end
