class Show < ApplicationRecord
  has_many :station_shows
  has_many :stations, through: :station_shows
  has_many :users, through: :station_shows
end
