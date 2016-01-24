require 'faker'

5.times do Category.create!(
  name: Faker::Commerce.department
  )
end

10.times do
  product = Product.create!(
    name: Faker::Commerce.product_name,
    price: rand(5..100),
    image: Faker::Avatar.image,
    category_id: rand(1..5)
    )
  Warehouse.create!(
    product_id: product.id,
    stock: rand(10..40),
    awaiting_shipment: rand(10..40))
end

User.create!(
  first_name: "Mia",
  last_name: "Lehrer",
  username:'admin',
  admin: true,
  password:'password')

User.create!(
  first_name: "Jon",
  last_name: "Clayton",
  username:'user',
  admin: true,
  password:'password')

18.times do |n|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: "user#{n}",
    admin: false,
    password:'password')

  address = Address.create!(
    user_id: user.id,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip.to_i,
    address_type: "home")

  FinancialInformation.create!(
    card_num: Faker::Business.credit_card_number + n.to_s,
    expiry: Faker::Business.credit_card_expiry_date,
    ccid: rand(1111..9999),
    address_id: address.id,
    user_id: user.id)
end

for i in 11..20 do
  user = User.find(i)
  cart = Cart.create!(user_id: user.id)
  rand(1..6).times do
    product = Product.all.sample
    CartProduct.create!(
      quoted_price: product.price,
      quantity: rand(1..5),
      cart_id: cart.id,
      product_id: product.id)
  end
end

# 5.times do |n|
#   order = Order.create!(
#     status: "pending",
#     address_id: Address.find(n+14),
#     financial_information_id: FinancialInformation.find(n+14),
#     cart_id: Cart.find(n+11))
# end

# 10.times do
#   Shipper.create!(name: Faker::Company.name)
# end

#tax table
#shipping cost table



