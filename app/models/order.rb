class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :financial_information
  belongs_to :address
end
