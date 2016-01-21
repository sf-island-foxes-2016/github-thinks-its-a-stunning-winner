require 'spec_helper'



RSpec.describe UserController, :type => :controller do

  describe "User is logged out" do
    it 'cannot access user page' do
      visit '/user/1'
      expect(page).to_not have_selector(".logout")
    end

    it 'allows login' do
      visit '/login'
      fill_in 'Username', :with => 'admin'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
      expect(page).to have_selector(".homepage-link-container")
    end
  end

  describe 'User is logged in' do
    it 'allows logout' do
      visit '/login'
      fill_in 'Username', :with => 'admin'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
    expect(page).to have_selector(".logout")
    end
  end
end
