class Show < ApplicationRecord
  has_many :station_shows
  has_many :stations, through: :station_shows
  has_many :users, through: :station_shows
  has_many :show_genres
  has_many :genres, through: :show_genres
  belongs_to :channel
  accepts_nested_attributes_for :genres

  validates :title, presence: true, uniqueness: { scope: :channel_id } # Validates uniqueness of title and channel
  validates :current_season, presence: true, numericality: true

  def channel_name=(name)
    self.channel = Channel.find_or_create_by(name: name) unless name.blank?
  end

  def channel_name
    self.channel ? self.channel.name : nil
  end

  def genres_attributes=(genre_attributes)
    genre_name = genre_attributes["0"]["name"]
    unless genre_name.blank?
      genre = Genre.find_or_create_by(name: genre_name)
      self.genres << genre
    end
  end
end
