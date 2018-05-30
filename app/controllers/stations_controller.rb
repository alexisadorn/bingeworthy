class StationsController < ApplicationController
  helper_method :current_user
  def index
    @user = current_user
    @stations = Station.user_stations(@user.id)
    @favorites = StationShow.my_favorites(@user.id)
  end

  def show
    @station = Station.find_by(id: params[:id])
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def destroy
  end
end
