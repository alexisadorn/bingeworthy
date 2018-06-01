class Show < ApplicationRecord
  has_many :station_shows
  has_many :stations, through: :station_shows
  has_many :users, through: :station_shows
  has_many :show_genres
  has_many :genres, through: :show_genres
  belongs_to :channel
  accepts_nested_attributes_for :genres, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :channel

  validates :title, presence: true, uniqueness: { scope: :channel_id } # Validates uniqueness of title and channel
  validates :day, inclusion:
            { in: %w(Mon Tues Wed Thur Fri Sat Sun),
              message: "%{value} is not a day of the week" },
              allow_nil: true
  validates :current_season, presence: true, numericality: true

  def genres_attributes=(genre_attributes)
    genre_attributes.values.each do |genre_attribute|
      genre = Genre.find_or_create_by(genre_attribute)
      self.genres << genre
    end
  end

  def channel_attributes=(channel_attributes)
    channel_attributes.values.each do |channel_attribute|
      channel = Channel.find_or_create_by(channel_attribute)
      self.channel = channel
    end
  end
end
