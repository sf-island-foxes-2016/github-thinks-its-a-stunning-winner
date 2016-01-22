class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create, :edit]

  def index
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    @user.title = 'user'
    @user.title = 'admin' if @user.username == 'jon' || @user.username == 'mia'
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path(id: @user.id)
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(session[:user_id])
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
      params.require(:user).permit(:username, :password)
    end

end
