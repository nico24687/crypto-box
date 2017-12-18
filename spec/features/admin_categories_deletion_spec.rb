require 'rails_helper'

describe "Category deletion" do
  it "allows admin to delete a category" do 
    category = create(:category)
    admin = User.create(user_name: "penelope", password: "boom", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    
    click_link "Delete"
    
    expect(Category.count).to eq(0)
  end

end 