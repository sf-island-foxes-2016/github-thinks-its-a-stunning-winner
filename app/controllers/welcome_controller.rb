class WelcomeController < ApplicationController

  def show
    @products = Product.all
end
