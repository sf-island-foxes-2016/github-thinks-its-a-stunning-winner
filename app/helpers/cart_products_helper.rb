module CartProductsHelper

include CartsHelper

  def all_cart_products
    @cart_products = @cart.CartProducts.all
  end

  def new_cart
    @cart_product = CartProducts.new
  end

  def create_cart
    @cart_product = CartProducts.new(cart_product_params)
    @cart_product.save
  end

  def find_cart
    @cart_product = CartProducts.find(cart_product_params[:id])
  end

  def update_cart
    @cart_product.update(cart_product_params)
  end

  def delete_cart
    find_cart
    @cart_product.destroy
  end

  private

    def cart_product_params
      params.require(:cart_product).permit(:cart_id, :user_id, :quoted_price, :quantity)
    end

end
