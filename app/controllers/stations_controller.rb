class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @station = Station.find_by(id: params[:id])
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
