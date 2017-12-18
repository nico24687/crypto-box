class CryptocurrenciesController < ApplicationController 
  before_action :require_owner, only: [:new, :create, :destroy, :edit, :update]

  def current_owner?
  
    params[:user_id].to_i == current_user.id
  end

  def require_owner
    render file: "public/404" unless current_owner?
  end

  def index 
    @cryptocurrencies = Cryptocurrency.where(user_id: params[:user_id])
  end

  def new 
    @cryptocurrency = Cryptocurrency.new 
  end 

  def create
    @cryptocurrency = Cryptocurrency.new(cryptocurrency_params)
    @cryptocurrency.user_id = params[:user_id]

    if @cryptocurrency.save 
       flash[:success] = "Successfully created your cryptocurrency"
       redirect_to  user_cryptocurrencies_path(params[:user_id])
    else
      render :new 
    end 
   
  end 

  def destroy 
    @cryptocurrency = Cryptocurrency.find(params[:id])
    if @cryptocurrency.destroy
      flash[:success] = "Successfully deleted your cryptocurrency"
      redirect_to user_cryptocurrencies_path(params[:user_id])
    else
      render :index
    end 
  end 

  def edit 
    @user = User.find(params[:user_id])
    @cryptocurrency = Cryptocurrency.find(params[:id])
  end 

  def update 
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @cryptocurrency.update(cryptocurrency_params)
    if @cryptocurrency.save
      flash[:success]= "Successfully updated your cryptocurrency"
      redirect_to user_cryptocurrencies_path(params[:user_id])
    else
      @user = User.find(params[:user_id])
      render :edit
    end 
  end

  

  private 
  
  def cryptocurrency_params 
    params.require(:cryptocurrency).permit(:name, :amount, :symbol, :category_id, image_ids: [])
  end 
end