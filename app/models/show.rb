class Show < ApplicationRecord
  has_many :station_shows
  has_many :stations, through: :station_shows
  has_many :users, through: :station_shows
  has_many :show_genres
  has_many :genres, through: :show_genres
  belongs_to :channel

  validates :title, presence: true, uniqueness: { scope: :channel_id } # Validates uniqueness of title and channel
  validates :day, inclusion:
            { in: %w(Mon Tues Wed Thur Fri Sat Sun),
              message: "%{value} is not a day of the week" },
              allow_nil: true
  validates :current_season, presence: true, numericality: true
end
