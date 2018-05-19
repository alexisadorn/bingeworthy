class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
  end

  def new
  end
end
