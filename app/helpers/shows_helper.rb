module ShowsHelper
  def alphebetized_shows
    @shows.sort_by { |s| s.title }
  end
end
