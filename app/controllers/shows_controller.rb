class ShowsController < ApplicationController
  before_action :require_login
  before_action :set_show, only: [:show, :edit, :update]
  before_action :created_by_current_user, only: [:edit, :update]

  def index
    if params[:user_id].present?
      @shows = Show.joins(:station_shows).where(:station_shows => {user_id: params[:user_id]})
    else
      @shows = Show.all
    end
  end

  def show
  end

  def new
    @show = Show.new
    @station_shows = @show.station_shows.build(station_id: params[:station_id])
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
    if params[:station_id]
      @station_shows = StationShow.find_by(station_id: params[:station_id], show_id: @show.id, user_id: current_user.id)
    end
  end

  def update
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
                                  :created_by,
                                  genre_ids:[],
                                  genres_attributes:[:name],
                                  channel_attributes:[:name],
                                  station_shows_attributes:[:station_id, :user_status, :user_season, :fav, :user_id])
  end

  def set_show
    @show = Show.find_by(id: params[:id])
  end

  def created_by_current_user
    unless @show.created_by == current_user.id
      flash[:danger] = "You cannot edit this show because you did not create it!"
      redirect_to show_path(@show)
    end
  end
end
