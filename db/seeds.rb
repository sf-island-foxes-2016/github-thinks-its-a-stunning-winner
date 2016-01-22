require 'faker'

User.create(username:'admin', title: 'admin', password:'password')
User.create(username:'user', title: 'user', password:'password')
10.times do
Product.create(
    name: Faker::Commerce.product_name,
    price: rand(5..100),
    image: Faker::Avatar.image,
    category: rand(1..5)
    )
  end

5.times do Category.create(
  name: Faker::Commerce.department
  )
end
