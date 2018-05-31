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
end
