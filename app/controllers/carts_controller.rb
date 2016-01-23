class CartsController < ApplicationController
  before_action :login_check

  def index
  end

  def new
  end

  def create
    @product = Product.find(params[:id])
    @product.add_to_cart
      format.html { redirect_to root_path, notice: "#{@product.name} added to cart." }
    redirect_to root_path
  end

  def show
    @cart = Cart.find_by(user_id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def cart_params
      # params.require(:product_id).permit(:quantity)
    end




end
