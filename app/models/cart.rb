class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def self.current(user_id)
  @cart = Cart.where(order_id: nil).find_by(user_id: user_id) || Cart.create(user_id: user_id)
  end

  def put_in (product_id)
    Product.find(product_id).add_to_cart(self.user_id)
  end

  def purchase
    order = Order.create(status: "pending", cart_id: @id)
    @order_id = order.id
    self.cart_products.each do |cart_product|
      cart_product.product.reserve_for_shipping(cart_product.quantity)
    end
  end

  def sub_total
    self.cart_products.sum(quoted_price)
  end

  def tax_amount
    sub_total * try(self.user.addresses.find_by_type(:primary).state.rate) || 0.075
  end

  def shipping_cost
    self.cart_products.count * try(self.user.get_a_shipping_cost) || 1.50
  end

  def handling_charge
    try(to_get_a_handling_charge) || 2.00
  end

  def total
    sub_total + tax_amount + shipping_cost + handling_charge
  end

end
