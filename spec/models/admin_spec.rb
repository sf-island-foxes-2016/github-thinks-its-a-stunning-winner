require 'rails_helper'

describe User do
  context 'new User' do
    it 'is valid with a username, title, and password' do
      user = User.new(username:'Bob', title: 'user', password:'password')
      user.valid?
    end
    it 'is invalid without a username' do
      user = User.new(password:'password')
      expect(user.valid?).to be false
    end
    it 'is invalid without a unique username' do
      user = User.create(username:'Bob', title: 'user', password:'password')
      user2 = User.create(username:'Bob', title: 'admin', password:'password')
      expect(user2.valid?).to be false
    end
  end
end
