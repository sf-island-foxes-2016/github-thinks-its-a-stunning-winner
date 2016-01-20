Admin.create(username:'admin', password:'password')
Category.create(name:"Stationery")
Product.create(stock_count: 3, name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1)
