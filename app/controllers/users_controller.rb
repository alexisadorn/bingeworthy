class UsersController < ApplicationController
  helper_method :logged_in?

  def new
    if logged_in?
      redirect_to stations_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to stations_path
    else
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
