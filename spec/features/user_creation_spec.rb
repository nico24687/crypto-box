require 'rails_helper'

describe "user creation" do 
  it "creates a user" do 
    visit new_user_path
  
    fill_in "user[user_name]", with: "nico24687"
    fill_in "user[password]", with: "donothackin"

    click_on "Create User"

    expect(page).to have_content("Welcome nico24687")
  end 
end