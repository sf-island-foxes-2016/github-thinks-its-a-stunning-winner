require 'rails_helper'

RSpec.describe Tax, :type => :model do
  # Basic validations
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:rate) }
  # Associations
end
