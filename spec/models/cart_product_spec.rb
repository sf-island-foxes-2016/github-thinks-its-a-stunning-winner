require 'rails_helper'

RSpec.describe CartProduct, :type => :model do
    # Basic validations
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quantity) }
    # Associations
    it { should belong_to(:product) }
    it { should belong_to(:cart) }
end
