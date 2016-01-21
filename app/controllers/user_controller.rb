class UserController < ApplicationController

  def index
  end

  def show
    unless session[:user_id]
      redirect_to login_path
    end
    @products = Product.all
    render 'show'
  end

end
