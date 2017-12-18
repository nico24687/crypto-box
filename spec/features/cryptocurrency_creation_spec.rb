require 'rails_helper'

describe "cryptocurrency creation" do 
  it "creates a cryptocurrency" do 
    category = create_list(:category, 3).last

    current_user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(current_user)
    visit  new_user_cryptocurrency_path(current_user)

  
  
    fill_in "cryptocurrency[name]", with: "Bitcoin"
    fill_in "cryptocurrency[amount]", with: 20
    fill_in "cryptocurrency[symbol]", with: "BTC"
    select category.title, from: 'cryptocurrency[category_id]'
    
    click_button "Create Cryptocurrency"

    expect(page).to have_content("Successfully created your cryptocurrency")
  end 
end 