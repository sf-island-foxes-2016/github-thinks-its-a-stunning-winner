class SessionsController < ApplicationController
  def create
    @admin = Admin.find_by(username: params[:session][:username])
    p params
    if @admin && @admin.password == params[:session][:password]
      session[:admin_id] = @admin.id
      p session[:admin_id]
      redirect_to @admin
    else
      render 'sessions/new'
    end
  end
end
