class Product < ActiveRecord::Base
  validates :name, :price, :category_id, presence: true
  validates :name, uniqueness: true

  has_many :cart_products
  has_many :carts, through: :cart_products
  has_one :inventory
  belongs_to :category

  def add_to_cart(units = 1)
    # if @stock >= units
    cart = Cart.where(order_id: nil).find_by(user_id: session[:user_id]) || Cart.create(user_id: session[:user_id])
    CartProduct.create(product_id: id, cart_id: cart.id, quantity: units, quoted_price: price )
  end

  def replenish_stock(units = 1)
    @stock += units
  end

  def reprice(new_price)
    @price = new_price
  end

end
