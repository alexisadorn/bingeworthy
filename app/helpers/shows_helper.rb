module ShowsHelper
  def watchlist_options(listings, show)
    if @listings.count > 0
      render :partial => "listing_info", :locals => {:listings => listings, :show => show}
    end
  end
end
