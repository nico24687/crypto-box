require 'rails_helper'

describe "cryptocurrency updating" do 
  context "with the owner of the cryptocurrency" do
    it "it updates the cryptocurrency" do 
      current_user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(current_user)

      category = create(:category)
      cryptocurrency = create(:cryptocurrency, user: current_user)

      visit  edit_user_cryptocurrency_path(current_user, cryptocurrency)
     
      fill_in "cryptocurrency[name]", with: "Bitcoin"
      fill_in "cryptocurrency[amount]", with: 20
      fill_in "cryptocurrency[symbol]", with: "BTC"
      select category.title, from: 'cryptocurrency[category_id]'
      
      click_button "Update Cryptocurrency"

      expect(page).to have_content("Successfully updated your cryptocurrency")
    end 
  end

  context "when you dont own the cryptocurrency" do
    it "it does not allow you to edit the cryptocurrency" do 
      cryptocurrency = create(:cryptocurrency)
    
      current_user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(current_user)

      visit edit_user_cryptocurrency_path(cryptocurrency.user_id, cryptocurrency)

      expect(page).to have_content("404")
    end 
  end
end 