class ProductsController < ApplicationController

  before_action :authorize, except: [:index, :show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to users_path(id: session[:user_id])
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
    if session[:user_id]
    @user = User.find(session[:user_id])
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to users_path(id: session[:user_id])
    else
      render 'show'
    end
  end

  private

    def product_params
      params.require(:product).permit(:stock_count, :name, :price, :image, :category)
    end

end
