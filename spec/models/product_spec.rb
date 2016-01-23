require 'rails_helper'

RSpec.describe Product do
  # category = Category.find_or_create_by(name: 'Stationery')
  context 'new Product' do
    it 'is valid with a stock count, name, price, image, and category' do
      product = Product.new(name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1 )
      expect(product.valid?).to be true
    end
    it 'is invalid without a name' do
      product = Product.new(price: 10, image: "/products/notebook.jpg", category_id: 1 )
      expect(product.valid?).to be false
    end
    it 'is invalid without a price' do
      product = Product.new(name: "Notebook", image: "/products/notebook.jpg", category_id: 1 )
      expect(product.valid?).to be false
    end
    it 'is invalid without a category' do
      product = Product.new(name: "Notebook", price: 10, image: "/products/notebook.jpg")
      expect(product.valid?).to be false
    end
  end
end

describe Product do
  # Basic validations
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:category_id) }
  # Associations
  it { should belong_to(:category) }
  it { should have_many(:carts).through(:cart_products) }
  it { should have_many(:cart_products) }
end

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
