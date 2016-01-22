require 'rails_helper'

RSpec.describe Warehouse, :type => :model do
  # Basic validations
  it { should validate_presence_of(:stock) }
  # Associations
  it { should belong_to(:product) }
end
