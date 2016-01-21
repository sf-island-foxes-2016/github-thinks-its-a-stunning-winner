require 'spec_helper'



RSpec.describe AdminController, :type => :controller do

  describe "Admin is logged out" do
    it 'cannot access admin page' do
      visit '/admin/1'
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

  describe 'Admin is logged in' do
    it 'allows logout' do
      visit '/login'
      fill_in 'Username', :with => 'admin'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
    expect(page).to have_selector(".logout")
    end
  end
end
