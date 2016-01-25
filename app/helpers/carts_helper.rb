module CartsHelper

  def current_cart
    @cart = Cart.find_by_user_id(current_user.id) || create_cart(current_user)
  end

  def all_carts
    @carts = Cart.all
  end

  def new_cart
    @cart = Cart.new
  end

  def create_cart
    @cart = Cart.new(cart_params)
    @cart.save
  end

  def find_cart
    @cart = Cart.find(params[:id])
  end

  def update_cart
    @cart.update(cart_params)
  end

  def delete_cart
    find_cart
    @cart.destroy
  end

  private

    def cart_params
      return params.permit(:id, :user_id, :order_id) unless params[:cart]
      params.require(:cart).permit(:id, :user_id, :order_id)
    end

end
