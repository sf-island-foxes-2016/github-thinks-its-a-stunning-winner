require 'rails_helper'

RSpec.describe Address, :type => :model do
    # Basic validations
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:address_type) }
    # Associations
    it { should belong_to(:user) }
end
