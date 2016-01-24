class UsersController < ApplicationController

  include UsersHelper

  before_action :authorize, except: [:new, :create, :edit, :update, :destroy]

  def index
    all_users
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path(id: @user.id)
    else
      render 'new'
    end
  end

  def new
    new_user
  end

  def edit
    redirect_to login_path unless session[:user_id]
    redirect_to user_path unless current_user.id == params[:id]
    find_user
  end

  def show
    unless session[:user_id]
      redirect_to login_path
    end
    @user = User.find(params[:id])
    @products = Product.all
    @categories = Category.all
    render 'show'
  end

  def update
    user = User.find(session[:user_id])
    if user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(session[:user_id])
    user.delete
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :password)
    end

end
