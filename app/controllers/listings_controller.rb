class ListingsController < ApplicationController
  def new
    @listing = Listing.new
    @listing.show = Show.find_by(id: params[:show_id])
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to show_path(@listing.show)
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find_by(id: params[:id])
  end

  def update
    @listing = Listing.find_by(id: params[:id])
    @listing.update(listing_params)
    if @listing.save
      redirect_to show_path(@listing.show)
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find_by(id: params[:id])
    if @listing
      @listing.destroy
      redirect_to watchlists_path
    else
      render 'shows/show'
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:watchlist_id, :show_id, :user_id, :user_status, :user_season, :fav)
  end
end
