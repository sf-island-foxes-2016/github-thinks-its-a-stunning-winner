class CartProduct < ActiveRecord::Base
  validates :quoted_price, :quantity, presence: true
  belongs_to :product
  belongs_to :cart

end
