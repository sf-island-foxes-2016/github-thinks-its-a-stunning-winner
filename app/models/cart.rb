class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def purchase
    order = Order.create(status: pending, cart_id: @id)
    @order_id = order.id
    @cart_products.each do |cp|
      Product.find(cp.product_id).stock -= cp.quantity
      # assign each item inventory status "pending" (present but committed)
    end
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
    Cart.find_by(user_id: session[:user_id], order_id: nil) || Cart.new
  end
end
