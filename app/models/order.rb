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
    # ship
  end

  def ship
    #package items
    #change inventory status to shipped for each
    #deliver to shipper
    #pay for shipment
  end

end
