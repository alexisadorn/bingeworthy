class UsersController < ApplicationController
  helper_method :logged_in?, :current_user

  def new
    if logged_in?
      redirect_to user_watchlists_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    if auth
      @user = User.new(
        email: auth[:info][:email],
        username: auth[:info][:name],
        password: SecureRandom.urlsafe_base64
      )
    else
      @user = User.new(user_params)
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_watchlists_path(@user)
    else
      render :new
    end
  end

  def show
    @user = current_user
    if logged_in?
      unless @user == User.find_by(id: params[:id])
        redirect_to user_watchlists_path(@user)
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

  def auth
    request.env['omniauth.auth']
  end
end
