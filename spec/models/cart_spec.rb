require 'rails_helper'

RSpec.describe Cart, :type => :model do
    # Basic validations
    # Associations
    it { should belong_to(:user) }
    it { should have_many(:products).through(:cart_products) }
    it { should have_many(:cart_products) }
end
