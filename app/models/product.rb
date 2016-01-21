class Product < ActiveRecord::Base
  validates :stock_count, :name, :price, :category, presence: true
end
