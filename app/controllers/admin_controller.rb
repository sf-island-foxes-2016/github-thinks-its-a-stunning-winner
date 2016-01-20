class AdminController < ApplicationController

  def index
  end

  def show
    @categories = Category.all
    render 'show'
  end

end
