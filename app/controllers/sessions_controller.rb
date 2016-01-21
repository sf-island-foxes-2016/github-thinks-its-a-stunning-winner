class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:session][:username])
    p params
    if @user && @user.password == params[:session][:password]
      session[:user_id] = @user.id
      p session[:user_id]
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
