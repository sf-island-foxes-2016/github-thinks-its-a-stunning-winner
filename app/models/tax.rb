class Tax < ActiveRecord::Base
  validates :state, :rate, presence: true
end
