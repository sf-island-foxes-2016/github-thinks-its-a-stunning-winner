class CartProductsController < ApplicationController
  before_action :logged_in?
  before_action :authorize, only: [:index]

  include CartProductsHelper

  def index
    all_cart_products
  end

  def new
    new_cart_product
  end

  def create
    if create_cart_product
      redirect_to index
    else
      render 'new'
    end
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
      redirect_to index
    else
      render 'edit'
    end
  end

  def destroy
    delete_cart_product
    redirect_to index
  end
end
