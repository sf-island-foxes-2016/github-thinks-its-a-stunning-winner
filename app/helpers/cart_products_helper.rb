module CartProductsHelper

include CartsHelper

  def all_cart_products
    @cart_products = CartProduct.all
  end

  def new_cart_product
    @cart_product = CartProduct.new
  end

  def create_cart_product
    @cart_product = CartProduct.new
    @cart_product.cart_id = current_cart.id
    @cart_product.product_id = cart_product_params[:product_id]
    @cart_product.quantity = cart_product_params[:quantity] || 1
    @cart_product.quoted_price = @cart_product.product.price
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
      return params.permit(:product_id, :id, :cart_id, :user_id, :quoted_price, :quantity) unless params[:cart_product]
      params.require(:cart_product).permit(:id, :product_id, :cart_id, :user_id, :quoted_price, :quantity)
    end

end
