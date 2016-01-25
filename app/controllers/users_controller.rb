class UsersController < ApplicationController

  include UsersHelper

  before_action :logged_in?, except: [:new, :create]
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
    puts "admin status is #{admin?}"
    puts "login status is #{logged_in?}"
    redirect_to action: "index" if admin?
    find_user
  end

  def show
    current_user
  end

  def update

    redirect_to user_path and return unless current_user.id == params[:id]
    user = User.find(session[:user_id])
    if user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    find_user
    @user.delete if @user == current_user  || admin?
    redirect_to root_path unless admin?
    redirect_to action: "index"
  end

  private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :password)
    end

end
