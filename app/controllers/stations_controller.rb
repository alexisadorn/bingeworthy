class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
