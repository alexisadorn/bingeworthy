class User < ApplicationRecord
  has_many :stations
  has_many :station_shows
  has_many :shows, through: :station_shows

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  def favorite_shows
    # List the user's shows where fav is true
    self.shows.includes(:station_shows).where(:station_shows => { fav: true })
  end
end
