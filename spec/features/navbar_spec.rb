require 'rails_helper'

RSpec.feature "Navbar features: ", type: :feature do

  context "logged in" do
    scenario "Can see log out button" do
      visit "/signup?"
      fill_in 'Name', with: "test_username"
      fill_in 'Email', with: "test@test.com"
      fill_in 'Password', with: "test123"
      click_button 'Create User'
      fill_in 'Email', with: "test@test.com"
      fill_in 'Password', with: "test123"
      click_button 'Log in'
      expect(page).to have_button("Log Out")
    end

    scenario "Can see Organisations" do
      visit "/signup?"
      fill_in 'Name', with: "test_username"
      fill_in 'Email', with: "test@test.com"
      fill_in 'Password', with: "test123"
      click_button 'Create User'
      fill_in 'Email', with: "test@test.com"
      fill_in 'Password', with: "test123"
      click_button 'Log in'
      click_link "Organisations"
      expect(page).to have_content("Logged in as test_username")
      expect(page).to have_content("Organisations")
    end

  end

  context "logged out" do
    scenario "Can not see log out button" do
      visit "/"
      expect(page).to_not have_content("Log Out")
    end
    
    scenario "Can't see edit profile" do
      visit "/"
      expect(page).to_not have_content("Edit Profile")
    end

  end
end
