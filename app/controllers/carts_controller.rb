class CartsController < ApplicationController
  before_action :login_check

  def index
  end

  def new
  end

  def create
    puts "Create is running, params are #{params}"
    @product = Product.find(params[:product_id])
    @product.add_to_cart(params[:id])
    redirect_to cart_path
  end

  def show
    @cart = Cart.current(params[:id])
  end

  def edit
  end

  def update
    puts "Update is running"
   @product = Product.find(params[:product_id])
    @product.add_to_cart(params[:id])
    @cart = Cart.find(params[:id])
    render "show"
  end

  def destroy
  end

  private

    def cart_params
      # params.require(:product_id).permit(:quantity)
    end




end
