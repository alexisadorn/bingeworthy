class StationsController < ApplicationController
  before_action :require_login
  before_action :set_user_station, only: [:show, :edit, :update, :destroy]

  def index
    @stations = current_user.stations
    @favorites = current_user.favorite_shows
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
  end

  def edit
  end

  def update
    @station.update(station_params)
    if @station.save
      redirect_to station_path(@station)
    else
      render :edit
    end
  end

  def destroy
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

  def set_user_station
    @station = Station.find_by(id: params[:id])
    unless @station.user == current_user
      flash[:error] = "This is not your station!"
      redirect_to stations_path
    end
  end
end
