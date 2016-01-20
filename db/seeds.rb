Admin.create(username:'admin', password:'password')
Category.create(name:"Stationery")
Product.create(stock_count: 3, name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1)
Product.create(stock_count: 4, name: "book", price: 10, image: "/products/book.jpg", category_id: 1)
