require 'rails_helper'

RSpec.describe FinancialInformation, :type => :model do
    # Basic validations
    it { should validate_presence_of(:card_num) }
    it { should validate_uniqueness_of(:card_num) }
    it { should validate_presence_of(:expiry) }
    it { should validate_presence_of(:ccid) }
    # Associations
    it { should belong_to(:address) }
    it { should belong_to(:user) }
  end
