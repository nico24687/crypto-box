require 'rails_helper'

describe "user login" do 
  it "can log a user in " do 
    create(:user, user_name: "nico24687", password: "donothackin")

    visit login_path 

    fill_in "user[user_name]", with: "nico24687"
    fill_in "user[password]", with: "donothackin"

    click_on "Login"

    expect(page).to have_content("Welcome nico24687")
  end 
end 