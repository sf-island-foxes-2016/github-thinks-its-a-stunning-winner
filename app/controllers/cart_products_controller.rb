class CartProductsController < ApplicationController
  before_action :logged_in?
  # before_action :authorize, only: [:index]

  include CartProductsHelper

  def index
    redirect_to root_path
  end

  def new
    puts params
    if create_cart_product
      redirect_to root_path
    else
      render 'new'
    end
  end

  def create
  end

  def show
    find_cart_product
  end

  def edit
    find_cart_product
  end

  def update
    find_cart_product
    if update_cart_product
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  def destroy
    delete_cart_product
    redirect_to action: "index"
  end
end
