class CartsController < ApplicationController
  before_action :logged_in?
  before_action :authorize, only: [:index]

  include CartsHelper

  def index
    all_carts
    puts @carts
  end

  def new
    new_cart
  end

  def create
    if create_cart
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def show
    find_cart
  end

  def edit
    find_cart
  end

  def update
    find_cart
    if update_cart
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  def destroy
    delete_cart
      redirect_to action: "index"
  end
end
