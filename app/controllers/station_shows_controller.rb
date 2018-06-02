class StationShowsController < ApplicationController
  helper_method :current_user
  def show
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
  end

  def update
  end

  def destory
  end

  private
  def station_show_params
    params.require(:station_show).permit(:station_id, :show_id, :user_id, :user_status, :user_season, :fav)
  end
end
