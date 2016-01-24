module ProductsHelper

  include AdminHelper

  def all_products
    @products =Product.all
  end

  def new_product
    @product = Product.new
  end

  def create_product
    @product = Product.new(product_params)
    @product.save
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def update_product
    @product.update(product_params)
  end

  def delete_product
    find_product
    @product.destroy
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :image, :category_id)
    end
end
