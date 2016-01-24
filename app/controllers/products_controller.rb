class ProductsController < ApplicationController

  include ProductsControllerHelper

  before_action :authorize, except: [:index, :show]

  def index
    all_categories
    all_products
  end

  def new
    all_categories
    new_product
  end

  def create
    if create_product
      redirect_to users_path(id: current_user_id)
    else
      all_categories
      render 'new'
    end
  end

  def show
    find_product
    current_user
  end

  def edit
    all_categories
    find_product
  end

  def update
    find_product
    if update_product
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    if delete_product
      redirect_to users_path(id: current_user_id)
    else
      render 'show'
    end
  end

end
