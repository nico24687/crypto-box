class CryptocurrenciesController < ApplicationController 

  def index 
    @cryptocurrencies = current_user.cryptocurrencies
  end

  def new 
    @cryptocurrency = Cryptocurrency.new 
  end 

  def create
    @cryptocurrency = Cryptocurrency.new(cryptocurrency_params)
    @cryptocurrency.user = current_user 

    if @cryptocurrency.save 
       flash[:success] = "Successfully created your cryptocurrency"
       redirect_to user_path(current_user)
    else
      render :new 
    end 
   
  end 

  def destory 

  end 

  

  private 
  
  def cryptocurrency_params 
    params.require(:cryptocurrency).permit(:name, :amount, :symbol, :category_id)
  end 
end