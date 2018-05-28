class StationsController < ApplicationController
  helper_method :current_user
  def index
    @stations = Station.all
    @user = current_user
  end

  def show
    @station = Station.find_by(id: params[:id])
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def destroy
  end
end
