class Product < ActiveRecord::Base
  validates :name, :price, :category_id, presence: true
  validates :name, uniqueness: true

  has_many :cart_products
  has_many :carts, through: :cart_products
  has_one :inventory

  def add_to_cart(user_id)
    # if @stock >= units
     @cart = Cart.where(order_id: nil).find_by(user_id: user_id) || Cart.create(id: user_id)
    CartProduct.create(product_id: id, cart_id: @cart.id, quantity: 1, quoted_price: price )
  end

  def replenish_stock(units = 1)
    @stock += units
  end

  def reprice(new_price)
    @price = new_price
  end

  # def current_cart(user_id)
  #   @cart = Cart.where(order_id: nil).find_by(user_id: user_id) || Cart.create(id: user_id)
  # end

end
