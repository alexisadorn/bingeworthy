class Show < ApplicationRecord
  has_many :station_shows
  has_many :stations, through: :station_shows
  has_many :users, through: :station_shows
  has_many :show_genres
  has_many :genres, through: :show_genres
  belongs_to :channel
end
