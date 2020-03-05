class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)

    if @user.save && user_params
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
      flash.alert = "Some information is missing."
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
