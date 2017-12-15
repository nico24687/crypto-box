require 'rails_helper'

describe "user creation" do 
  it "creates a user" do 
    visit new_user_path
  
    fill_in "user[user_name]", with: "nico24687"
    fill_in "user[password]", with: "donothackin"

    click_on "Create User"

    expect(page).to have_content("Welcome nico24687")
  end 

  it "cant create a user with the same username " do 
    create(:user, user_name: "nico24687" )

    visit new_user_path

    fill_in "user[user_name]", with: "nico24687"
    fill_in "user[password]", with: "notrealpassword"

    click_on "Create User"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("User already exists")

  end
end