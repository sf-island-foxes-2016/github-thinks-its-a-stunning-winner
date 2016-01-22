class Address < ActiveRecord::Base
  validates :street, :city, :state, :zip, :address_type, presence: true
  belongs_to :user
end

