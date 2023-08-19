# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# require 'faker'

# # Create Stores
# 5.times do
#   Store.create!(
#     name: Faker::Company.name,
#     location: Faker::Address.city
#   )
# end

# # Create Products
# 10.times do
#   product = Product.new(
#     name: Faker::Commerce.product_name,
#     description: Faker::Lorem.sentence,
#     store_id: Store.pluck(:id).sample
#   )
#   product.image.attach(io: URI.open(Faker::Avatar.image), filename: "#{Faker::Lorem.word}.png")
# end


require 'faker'

# Create Stores
stores = []
10.times do
  store = Store.create!(
    name: Faker::Company.name,
    location: Faker::Address.city
  )
  stores << store
end

# Create Products and Associate Them with Multiple Stores
20.times do
  product = Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence
  )
  product.image.attach(io: URI.open(Faker::Avatar.image), filename: "#{Faker::Lorem.word}.png")
  #

  # Associate the Product with Multiple Stores
  stores.sample(rand(1..stores.length)).each do |store|
    product_stores_attributes = {
      store_id: store.id
    }
    product.product_stores.create!(product_stores_attributes)
  end
end

