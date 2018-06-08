class ShowsController < ApplicationController
  before_action :require_login
  before_action :set_show, only: [:show, :edit, :update]
  before_action :created_by_current_user, only: [:edit, :update]
  helper_method :current_user

  def index
    @user = User.find_by(id: params[:user_id])
    if @user
      @shows = @user.shows.uniq
    else
      @shows = Show.all
    end
  end

  def show
    @listings = @show.watchlists_by_user(current_user.id)
  end

  def new
    @show = Show.new
    @listings = @show.listings.build
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
                                  listings_attributes:[:watchlist_id, :user_status, :user_season, :fav, :user_id])
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
