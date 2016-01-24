class CategoriesController < ApplicationController

  include CategoriesHelper

  before_action :authorize

  def index
    all_categories
  end

  def new
    new_category
  end

  def create
    if create_category
      redirect_to index
    else
      render 'new'
    end
  end

  def show
    find_category
  end

  def edit
    find_category
  end

  def update
    find_category
    if update_category
      redirect_to index
    else
      render 'edit'
    end
  end

  def destroy
    delete_category
    redirect_to index
  end
end
