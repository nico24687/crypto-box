class UsersController < ApplicationController
  def new 
    @user = User.new
  end 
  
  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.user_name}"
      session[:user_id] = @user.id
      redirect_to  user_cryptocurrencies_path(@user)
    else
      flash[:alert] = "User already exists"
      render :new 
    end
    
    
  end

  def show 
    @user = User.find(params[:id])
  end 

  private
    def user_params
      params.require(:user).permit(:user_name, :password)
    end
end