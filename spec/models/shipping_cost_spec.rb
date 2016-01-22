require 'rails_helper'

RSpec.describe ShippingCost, :type => :model do
  # Basic validations
  it { should validate_presence_of(:cost) }
  it { should validate_presence_of(:state) }
  # Associations
  it { should belong_to(:shipper) }
end
