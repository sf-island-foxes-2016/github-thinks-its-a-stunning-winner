class Warehouse < ActiveRecord::Base
  validates :stock, :awaiting_shipment, presence: true

  belongs_to :product
end
