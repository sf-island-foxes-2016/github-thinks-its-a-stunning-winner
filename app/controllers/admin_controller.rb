class AdminController < ApplicationController

  def index
  end

  def show
    unless session[:admin_id]
      redirect_to login_path
    end
    @categories = Category.all
    @products = Product.all
    render 'show'
  end

end
