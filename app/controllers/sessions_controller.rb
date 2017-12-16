class SessionsController < ApplicationController 
  def new 
    
  end

  def create
    user = User.find_by(user_name: user_params[:user_name])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end 

  private
    def user_params 
      params.require(:user).permit(:user_name, :password)
    end

end 