require 'rails_helper'

RSpec.describe Product do
  # category = Category.find_or_create_by(name: 'Stationery')
  context 'new Product' do
    it 'is valid with a stock count, name, price, image, and category' do
      product = Product.new(stock_count: 3, name: "Notebook", price: 10, image: "/products/notebook.jpg", category: 'category')
      expect(product.valid?).to be true
    end
    it 'is invalid without a stock count' do
      product = Product.new( name: "Notebook", price: 10, image: "/products/notebook.jpg", category: 'category')
      expect(product.valid?).to be false
    end
    it 'is invalid without a name' do
      product = Product.new(stock_count: 3, price: 10, image: "/products/notebook.jpg", category: 'category')
      expect(product.valid?).to be false
    end
    it 'is invalid without a price' do
      product = Product.new(stock_count: 3, name: "Notebook", image: "/products/notebook.jpg", category: 'category')
      expect(product.valid?).to be false
    end
    it 'is invalid without a category' do
      product = Product.new(stock_count: 3, name: "Notebook", price: 10, image: "/products/notebook.jpg")
      expect(product.valid?).to be false
    end
  end
end

# describe Product do
#     # Basic validations
#     it { should validate_presence_of(:name) }
#     it { should validate_uniqueness_of(:name) }
#     it { should validate_presence_of(:price) }
#     it { should validate_presence_of(:description) }
#     it { should validate_presence_of(:category_id) }
#     # Associations
#     it { should belong_to(:category) }
#     it { should have_many(:users).through(:shopping_carts) }
# end


# describe Product do
#   it "creates an item" do
#     expect(Product.create(name: "Dog", description: "ugly", price: 20.0, category_id: 1)).to be_valid
#   end
# end

# describe "responds to its methods" do
#   let(:product){Product.create(name: "Dog", description: "ugly", price: 20.0, category_id: 1)}
#   describe "public instance methods" do
#     context "responds to its methods" do
#       it { expect(product).to respond_to(:talk) }
#     end
#     context "#method talk" do
#       it { expect(product.talk).to eq("Woof") }
#     end
#   end
# end
