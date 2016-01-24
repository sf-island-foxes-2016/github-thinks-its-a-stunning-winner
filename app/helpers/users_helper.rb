module UsersHelper

  include AdminHelper

  def all_users
    @users =User.all
  end

  def new_product
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    @user.save
  end

  def find_user
    @user = User.find(params[:id])
  end

  def update_user
    @user.update(user_params)
  end

  def delete_user
    find_user
    @user.destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :password)
    end
end
