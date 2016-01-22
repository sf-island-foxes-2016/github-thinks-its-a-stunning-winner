class Shipper < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :shipping_costs
end
