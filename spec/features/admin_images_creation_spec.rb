require 'rails_helper'

describe "Image creation" do
  it "allows admin to create a new image" do 
    admin = User.create(user_name: "penelope", password: "boom", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_image_path
    
    
    fill_in "image[url]", with: "https://cdn-images-1.medium.com/max/1024/1*TY0eUcLT6us5Jz1VT1Tymg.jpeg"

    click_button "Create Image"

    
    expect(page).to have_content("Successfully created your image")
    expect(current_path).to eq(admin_images_path)
  end
end 