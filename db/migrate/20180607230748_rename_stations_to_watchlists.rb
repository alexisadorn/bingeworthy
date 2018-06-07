class RenameStationsToWatchlists < ActiveRecord::Migration[5.2]
  def change
    rename_table :stations, :watchlists
    rename_column :listings, :station_id, :watchlist_id
  end
end
