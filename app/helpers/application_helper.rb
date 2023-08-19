module ApplicationHelper
  def store_price(product, store)
    product_store = product.product_stores.find_by(store: store)
    product_store ? product_store.price : "N/A"
  end
end
