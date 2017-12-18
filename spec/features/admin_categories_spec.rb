require "rails_helper"

describe "User visits categories index page" do
  context "as admin" do
    it "allows admin to see all categories" do
	   admin = User.create(user_name: "penelope", password: "boom", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content("Admin Categories")
    end
    
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

  context "as default user" do 
    it "default user can't see admin categories index" do
      user = User.create(user_name: "fern@gully.com", password: "password", role:0)
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit admin_categories_path 
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end 
  end 

end