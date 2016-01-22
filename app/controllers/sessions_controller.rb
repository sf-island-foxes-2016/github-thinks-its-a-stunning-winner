class SessionsController < ApplicationController

  def new
  end

  def create
    username = params[:session][:username]
    puts username
    user = User.find_by_username(username)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:user_id, :password)
  end

end
