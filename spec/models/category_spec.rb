require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do 
    it "has a valid factory" do 
      category = build(:category)

      expect(category).to be_valid
    end 
    it "requires a title" do 
      category = build(:category, title: "")

      expect(category).not_to be_valid
    end 
  end 
  
   it "has many cryptocurrencies" do 
      category = build(:category)

      expect(category).to respond_to(:cryptocurrencies)
    end 

end
