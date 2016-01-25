module CartProductsHelper

include CartsHelper

  def all_cart_products
    @cart_products = CartProduct.all
  end

  def new_cart_product
    @cart_product = CartProduct.new
  end

  def create_cart_product
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.save
  end

  def find_cart_product
    @cart_product = CartProduct.find(params[:id])
  end

  def update_cart_product
    @cart_product.update(cart_product_params)
  end

  def delete_cart_product
    find_cart_product
    @cart_product.destroy
  end

  private

    def cart_product_params
      return params.permit(:id, :cart_id, :user_id, :quoted_price, :quantity) unless params[:cart_product]
      params.require(:cart_product).permit(:id, :cart_id, :user_id, :quoted_price, :quantity)
    end

end
