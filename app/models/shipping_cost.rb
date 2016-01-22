class ShippingCost < ActiveRecord::Base
  validates :cost, :state, presence: true

  belongs_to :shipper
end
