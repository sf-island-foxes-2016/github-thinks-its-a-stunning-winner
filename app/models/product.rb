class Product < ActiveRecord::Base
  validates :name, :price, :category_id, presence: true
  validates :name, uniqueness: true

  has_many :cart_products
  has_many :carts, through: :cart_products
  has_one :inventory

  def add_to_cart(units = 1)
    # if @stock >= units
    # check whether already in cart
    CartProduct.create(product_id: id, user_id: session[:user_id], quantity: units, quoted_price: @price )
  end

  def replenish_stock(units = 1)
    @stock += units
  end

  def reprice(new_price)
    @price = new_price
  end

end
