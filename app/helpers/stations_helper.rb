module StationsHelper
  def alphebetized_stations
    @stations.sort_by { |s| s.name }
  end
end
