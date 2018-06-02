class ShowsController < ApplicationController
  before_action :require_login
  before_action :set_show, only: [:show, :edit, :update]
  before_action :created_by_current_user, only: [:edit, :update]

  def index
    @shows = Show.all
  end

  def show
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
