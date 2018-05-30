class StationsController < ApplicationController
  helper_method :current_user
  def index
    @user = current_user
    @stations = Station.user_stations(@user.id)
    @favorites = StationShow.my_favorites(@user.id)
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to station_path(@station)
    else
      render :new
    end
  end

  def show
    @station = Station.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def station_params
    params.require(:station).permit(:name, :description, :user_id)
  end
end
