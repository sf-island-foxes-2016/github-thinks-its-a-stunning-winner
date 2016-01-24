module AdminHelper

  def current_user
    @user = User.find(current_user_id) if current_user_id
  end

  def current_user_id
    session[:user_id]
  end

end
