require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do 
    expect(build(:user)).to be_valid 
  end 

  describe "validations" do 
    it "requires a username" do 
      user = build(:user, user_name: "") 

      expect(user).not_to be_valid
    end

    it "requires a password" do 
      user = build(:user, password: "")

      expect(user).not_to be_valid
    end 

    it "requires a unique username" do 
      create(:user, user_name: "unique_username")
      user = build(:user, user_name: "unique_username")

      expect(user).not_to be_valid
    end 
  end

  describe "creating a user" do
    it "generates a password digest based on the password" do 
      user = create(:user)

      expect(user.password_digest).not_to be_nil 
    end  
  end 
end
