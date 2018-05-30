class Station < ApplicationRecord
  belongs_to :user
  has_many :station_shows
  has_many :shows, through: :station_shows

  validates :name, presence: true

  def self.user_stations(uid)
    Station.where(user_id: uid)
  end
end
