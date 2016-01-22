class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def purchase
    # create new order_id
    # assign each item inventory status pending shipment
  end

  def tax_amount
  end

  def shipping_cost
  end

  def handling_charge
  end

  def sub_total
  end

  def self.current
    Cart.find_by(user_id: session[:user_id], order_id: nil)
  end

end
