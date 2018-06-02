class ShowsController < ApplicationController
  helper_method :current_user
  def index
    @shows = Show.all
  end

  def show
    @show = Show.find_by(id: params[:id])
    @user_shows = current_user.shows.where(id: @show.id)
  end

  def new
    @show = Show.new
    @station_shows = @show.station_shows.build
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to show_path(@show)
    else
      render :new
    end
  end

  def edit
    @show = Show.find_by(id: params[:id])
  end

  def update
    @show = Show.find_by(id: params[:id])
    @show.update(show_params)
    if @show.save
      redirect_to show_path(@show)
    else
      render :edit
    end
  end

  private
  def show_params
    params.require(:show).permit( :title,
                                  :description,
                                  :channel_id,
                                  :day,
                                  :time,
                                  :current_season,
                                  genre_ids:[],
                                  genres_attributes:[:name],
                                  channel_attributes:[:name],
                                  station_shows_attributes:[:station_id, :user_status, :user_season, :fav, :user_id])
  end
end
