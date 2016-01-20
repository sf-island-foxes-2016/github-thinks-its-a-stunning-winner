class Product < ActiveRecord::Base
  belongs_to :category
  validates :stock_count, :name, :price, :category, presence: true
end
