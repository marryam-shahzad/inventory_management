class AddPriceToProductStores < ActiveRecord::Migration[7.0]
  def change
    add_column :product_stores, :price, :decimal
  end
end
