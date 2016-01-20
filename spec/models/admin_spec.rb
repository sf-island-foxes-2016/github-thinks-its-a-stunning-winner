require 'rails_helper'

describe Admin do
  context 'new Admin' do
    it 'is valid with a username and password' do
      admin = Admin.new(username:'admin', password:'password')
      admin.valid?
    end
    it 'is invalid without a username' do
      admin = Admin.new(password:'password')
      expect(admin.valid?).to be false
    end
    it 'is invalid without a unique username' do
      admin = Admin.create(username:'admin', password:'password')
      admin2 = Admin.new(username:'admin', password:'password')
      expect(admin2.valid?).to be false
    end
  end
end
