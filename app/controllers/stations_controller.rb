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
    @station = Station.find_by(id: params[:id])
  end

  def update
    @station = Station.find_by(id: params[:id])
    @station.update(station_params)
    if @station.save
      redirect_to station_path(@station)
    else
      render :edit
    end
  end

  def destroy
    @station = Station.find_by(id: params[:id])
    if @station
      @station.destroy
      redirect_to stations_path
      flash[:message] = "Your station has been shut down"
    else
      render :show
    end 
  end

  private
  def station_params
    params.require(:station).permit(:name, :description, :user_id)
  end
end
