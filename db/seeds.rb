require 'faker'

User.create(first_name: "Jon", last_name: "Mia", username:'admin', admin: true, password:'password')
User.create(first_name: "Jon", last_name: "Mia", username:'user', admin: false, password:'password')
10.times do
Product.create(
    name: Faker::Commerce.product_name,
    price: rand(5..100),
    image: Faker::Avatar.image,
    category_id: rand(1..5)
    )
  end

5.times do Category.create(
  name: Faker::Commerce.department
  )
end
