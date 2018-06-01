class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    @show = Show.find_by(id: params[:id])
  end

  def new
    @show = Show.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def show_params
    params.require(:show).permit(:title, :description, :channel_id, :day, :time, :current_season, genre_ids:[], genres_attributes:[:name])
  end
end
