require 'rails_helper'

RSpec.describe Cryptocurrency, type: :model do
  it "has a valid factory" do 
    expect(build(:cryptocurrency)).to be_valid
  end 
  describe "validations" do 
    it "requires a name " do
      cryptocurrency = build(:cryptocurrency, name: "")

      expect(cryptocurrency).not_to be_valid
    end 
    it "requires an ammount greater than zero" do
      expect(build(:cryptocurrency, amount: 0)).not_to be_valid
      expect(build(:cryptocurrency, amount: -1)).not_to be_valid
      expect(build(:cryptocurrency, amount: "")).not_to be_valid
    end 
  end 
end
