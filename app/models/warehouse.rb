class Warehouse < ActiveRecord::Base
  validates :stock, presence: true

  belongs_to :product
end
