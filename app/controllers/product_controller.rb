class ProductController < ApplicationController

  def new
    render 'new'
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to user_path(id: session[:user_id])
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to user_path(id: session[:user_id])
    else
      render 'show'
    end
  end

  private

    def product_params
      params.require(:product).permit(:stock_count, :name, :price, :image, :category)
    end

end
