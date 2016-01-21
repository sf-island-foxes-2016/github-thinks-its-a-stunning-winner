User.create(username:'admin', title: 'admin', password:'password')
User.create(username:'user', title: 'user', password:'password')
Product.create(stock_count: 3, name: "Notebook", price: 10, image: "/products/notebook.jpg", category: "stationery")
Product.create(stock_count: 4, name: "book", price: 10, image: "/products/book.jpg", category: "media")
