class Product < ActiveRecord::Base
  validates :name, :price, :category_id, presence: true
  validates :name, uniqueness: true

  has_many :cart_products
  has_many :carts, through: :cart_products
end
