class SessionsController < ApplicationController 
  def new 
    
  end

  def create
    user = User.find_by(user_name: user_params[:user_name])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.user_name}"
      redirect_to user_cryptocurrencies_path(user)
    else
      render :new
    end
  end 

  private
    def user_params 
      params.require(:user).permit(:user_name, :password)
    end

end 