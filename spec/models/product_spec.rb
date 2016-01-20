require 'rails_helper'

RSpec.describe Product do
  category = Category.find_by(name: 'Stationery')
  context 'new Product' do
    it 'is valid with a stock count, name, price, image, and category' do
      product = Product.new(stock_count: 3, name: "Notebook", price: 10, image: "/products/notebook.jpg", category: category)
      expect(product.valid?).to be true
    end
    it 'is invalid without a stock count' do
      product = Product.new( name: "Notebook", price: 10, image: "/products/notebook.jpg", category: category)
      expect(product.valid?).to be false
    end
    it 'is invalid without a name' do
      product = Product.new(stock_count: 3, price: 10, image: "/products/notebook.jpg", category: category)
      expect(product.valid?).to be false
    end
    it 'is invalid without a price' do
      product = Product.new(stock_count: 3, name: "Notebook", image: "/products/notebook.jpg", category: category)
      expect(product.valid?).to be false
    end
    it 'is invalid without a category' do
      product = Product.new(stock_count: 3, name: "Notebook", price: 10, image: "/products/notebook.jpg")
      expect(product.valid?).to be false
    end
  end
end

