User.create(username:'admin', title: 'admin', password:'password')
User.create(username:'user', title: 'user', password:'password')
10.times do
Product.create(
    stock_count: rand(1..30)
    name: Faker::Commerce.product_name
    price: rand(5..100)
    image: Faker::Avatar.image
    category: categories.sample
  end

categories = ["Pokemon", "Rocks", "Minerals", "Macrolichens"]
