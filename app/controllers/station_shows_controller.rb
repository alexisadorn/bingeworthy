class StationShowsController < ApplicationController
  helper_method :current_user
  def show
    @station_show = StationShow.find_by(id: params[:id])
  end

  def new
  end

  def create
    station_show = StationShow.new(station_show_params)
    if station_show.save
      redirect_to show_path(station_show.show_id)
    else
      redirect_to 'shows/show'
    end
  end

  def edit
    @my_show = StationShow.find_by(id: params[:id])
  end

  def update
    @station_show = StationShow.find_by(params[:id])
    @station_show.update(station_show_params)
    if @station_show.save
      redirect_to station_path(@station_show.station_id)
    else
      render :edit
    end
  end

  def destroy
    @show = Show.find(params[:station_show][:show_id])
    station_show = StationShow.find_by(
      user_id: params[:station_show][:user_id],
      show_id: params[:station_show][:show_id],
      station_id: params[:station_show][:station_id]
    )
    station_show.destroy
    redirect_to show_path(@show)
  end

  private
  def station_show_params
    params.require(:station_show).permit(:station_id, :show_id, :user_id, :user_status, :user_season, :fav)
  end
end
