require 'rails_helper'

RSpec.feature "Shift", type: :feature do
  scenario "Doesn't let you create shift " do
    visit "/signup?"
    fill_in 'Name', with: "test_username"
    fill_in 'Email', with: "test@test.com"
    fill_in 'Password', with: "test123"
    click_button 'Create User'
    fill_in 'Email', with: "test@test.com"
    fill_in 'Password', with: "test123"
    click_button 'Log in'
    click_link "Organisations"
    click_link "New organisation"
    fill_in 'Name', with: "test_username"
    fill_in 'Hourly rate', with: "10"
    click_button 'Create Organisation'
    click_link "View Shifts"
    click_link "New shift"
    click_button 'Create Shift'
    expect(page).to have_content("4 errors prohibited this shift from being saved:\nFull name can't be blank Shift date can't be blank Start time can't be blank Finish time can't be blank") 
  end 
end