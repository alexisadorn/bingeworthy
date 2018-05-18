class User < ApplicationRecord
  has_many :stations
  has_many :station_shows
  has_many :shows, through: :station_shows

  has_secure_password
end
