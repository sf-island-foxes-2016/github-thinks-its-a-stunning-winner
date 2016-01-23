require 'rails_helper'

RSpec.describe Category, :type => :model do
    # Basic validations
    # Associations
    it { should have_many(:products) }
  end
