class WatchlistsController < ApplicationController
  before_action :require_login
  before_action :set_user_watchlist, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :edit, :update, :show]

  def index
    @watchlists = current_user.watchlists
    @favorites = current_user.favorite_shows
  end

  def new
    @watchlist = Watchlist.new
  end

  def create
    @watchlist = @user.watchlists.build(watchlist_params)
    if @watchlist.save
      redirect_to watchlist_path(@watchlist)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @watchlist.update(watchlist_params)
    if @watchlist.save
      redirect_to watchlist_path(@watchlist)
    else
      render :edit
    end
  end

  def destroy
    if @watchlist
      @watchlist.destroy
      redirect_to watchlists_path
      flash[:message] = "Your watchlist has been deleted"
    else
      render :show
    end
  end

  private
  def watchlist_params
    params.require(:watchlist).permit(:name, :description, :user_id)
  end

  def set_user_watchlist
    @watchlist = Watchlist.find_by(id: params[:id])
    unless @watchlist.user == current_user
      flash[:error] = "This is not your watchlist!"
      redirect_to watchlists_path
    end
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end
