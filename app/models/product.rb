class Product < ActiveRecord::Base
  validates :stock_count, :name, :price, :category, presence: true

  has_many :cart_products
  has_many :carts, through: :cart_products
end
