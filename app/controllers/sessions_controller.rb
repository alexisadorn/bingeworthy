class SessionsController < ApplicationController
  helper_method :logged_in?
  def new
    if logged_in?
      redirect_to stations_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to stations_path
    else
      flash.now[:danger] = "Wrong email and/or password"
      render :new
    end
  end

  def destroy
    if logged_in?
      session.clear
      redirect_to '/'
    else
      redirect_back(fallback_location: root_path)
    end
  end
end