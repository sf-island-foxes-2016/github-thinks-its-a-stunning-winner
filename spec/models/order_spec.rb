require 'rails_helper'

RSpec.describe Order, :type => :model do
  # Basic validations
  it { should validate_presence_of(:status) }

  # Associations
  it { should belong_to(:cart) }
  it { should belong_to(:financial_information) }
  it { should belong_to(:address) }
end
