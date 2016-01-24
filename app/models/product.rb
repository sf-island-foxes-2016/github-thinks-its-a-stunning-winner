 class Product < ActiveRecord::Base
  validates :name, :price, :category_id, :image,  presence: true
  validates :name, uniqueness: true

  has_many :cart_products
  has_many :carts, through: :cart_products
  has_one :warehouse
  belongs_to :category

  def add_to_cart(user_id, quantity)
    return false if stock < quantity
    @cart = Cart.where(order_id: nil).find_by(user_id: user_id) || Cart.create(id: user_id)
    if @cart.where(product_id: @id).count == 0
      CartProduct.create(product_id: id, cart_id: @cart.id, quantity: quantity, quoted_price: price )
    else
      @cart.cart_products.find_by(product_id: product_id).quantity += quantity
    end
    true
  end

  def reserve_for_shipping(units)
    if self.stock >= units
      self.warehouse.stock -= units
      self.warehouse.awaiting_shipping += units
      true
    else
      false
    end
  end

  def restock(units)
    self.warehouse.stock += units
  end

  def reprice(new_price)
    @price = new_price
  end

  def stock
    self.warehouse.stock
  end

  def ship(quantity)
    return false if self.warehouse.awaiting_shipping < quantity
    self.warehouse.awaiting_shipping -= quantity
    true
  end

end
