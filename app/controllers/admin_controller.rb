class AdminController < ApplicationController

  def index
  end

  def show
    @categories = Category.all
    @products = Product.all
    render 'show'
  end

end
