class SessionsController < ApplicationController

  def new
  end

  def create
    # OLD VERSION 
    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    # NEW VERSION
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else 
      redirect_to '/login'
      flash.alert = "Username or password is incorrect. Or maybe both are..."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
