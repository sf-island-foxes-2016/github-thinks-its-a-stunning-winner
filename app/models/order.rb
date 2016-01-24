class Order < ActiveRecord::Base
  validates :status, presence: true

  belongs_to :cart
  belongs_to :financial_information
  belongs_to :address

  def send_bill
    # send invoice to selected credit card
  end

  def process_payment
    # do_accounting
    ship
  end

  def ship
    self.cart_products.each do |cart_product|
      cart_product.product.ship(cart_product.quantity)
    end
    #package items
    #deliver to shipper
    #pay for shipment
  end

end
