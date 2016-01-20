class ProductController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    render 'new'
  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.new(product_params)
    @product.category = @category
    if @product.save
      redirect_to admin_path(id: session[:admin_id])
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    if @product.update(product_params)
      redirect_to category_product_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    if @product.destroy
      redirect_to admin_path(id: session[:admin_id])
    else
      render 'show'
    end
  end

  private

    def product_params
      params.require(:product).permit(:stock_count, :name, :price, :image, :category, :category_id)
    end

end
