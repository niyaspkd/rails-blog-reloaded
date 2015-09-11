class UsersController < ApplicationController

  def new

  end

  #create new users and save it in the database
  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/Signup/'
    end
  end







  private
#strong parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end