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
    params[:show][:channel_name] = "" if params[:show][:channel_id].present?
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
  end

  private
  def show_params
    params.require(:show).permit(:title, :description, :channel_id, :channel_name, :day, :time, :current_season, genre_ids:[], genres_attributes:[:name])
  end
end
