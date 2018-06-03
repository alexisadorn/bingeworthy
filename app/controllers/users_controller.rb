class UsersController < ApplicationController
  helper_method :logged_in?, :current_user

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
      render :new
    end
  end

  def show
    if logged_in?
      @user = current_user
      user_from_params = User.find_by(id: params[:id])
      unless @user == user_from_params
        redirect_to stations_path
        flash[:danger] = "You don't have access to view that user's settings!"
      end
    else
      redirect_to login_path
    end

  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
