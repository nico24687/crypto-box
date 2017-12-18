require 'rails_helper'

describe "Category creation" do
  it "allows admin to create a new category" do 
    admin = User.create(user_name: "penelope", password: "boom", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path
    
    
    fill_in "category[title]", with: "Proof of stake"
    fill_in "category[description]", with: "Mining power is proportional to coins held by miner"
    click_button "Create Category"

    expect(page).to have_content("Successfully created your category")
    expect(current_path).to eq(admin_categories_path)
  end
end 