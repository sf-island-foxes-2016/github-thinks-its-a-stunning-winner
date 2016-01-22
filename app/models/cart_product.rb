class CartProduct < ActiveRecord::Base
  validates :price, :quantity, presence: true
  belongs_to :product
  belongs_to :cart

end
