require 'rails_helper'

describe "Cryptocurrency deletion" do
  it "allows owner to delete his/her cryptocurrency" do 
    user = create(:cryptocurrency).user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_cryptocurrencies_path(user)
    
    click_link "Delete"
    
    expect(Cryptocurrency.count).to eq(0)
  end

end 