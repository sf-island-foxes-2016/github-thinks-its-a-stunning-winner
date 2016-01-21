class UserController < ApplicationController

  def index
  end

  def show
    unless session[:user_id]
      redirect_to login_path
    end
    @user = User.find(params[:id])
    @products = Product.all
    render 'show'
  end

end
