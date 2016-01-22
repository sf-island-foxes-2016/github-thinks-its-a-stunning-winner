class FinancialInformation < ActiveRecord::Base
  validates :card_num, :expiry, :ccid, presence: true
  validates :card_num, uniqueness: true
  belongs_to :address
  belongs_to :user
end
