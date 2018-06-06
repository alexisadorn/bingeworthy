class StationShowsController < ApplicationController
  def new
    @station_show = StationShow.new
    @station_show.show = Show.find_by(id: params[:show_id])
    @station_show.save
  end

  def create
    @station_show = StationShow.new(station_show_params)
    if @station_show.save
      redirect_to show_path(@station_show.show)
    else
      render :new
    end
  end

  def edit
    @station_show = StationShow.find_by(id: params[:id])
  end

  def update
    @station_show = StationShow.find_by(id: params[:id])
    @station_show.update(station_show_params)
    if @station_show.save
      redirect_to show_path(@station_show.show)
    else
      render :edit
    end
  end

  def destroy
    @station_show = StationShow.find_by(id: params[:station_show_id])
    binding.pry
    if @station_show
      @station_show.destroy
      redirect_to stations_path
    else
      render 'shows/show'
    end
  end

  private
  def station_show_params
    params.require(:station_show).permit(:station_id, :show_id, :user_id, :user_status, :user_season, :fav)
  end
end
