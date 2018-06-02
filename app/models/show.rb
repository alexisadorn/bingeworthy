class Show < ApplicationRecord
  has_many :station_shows
  has_many :stations, through: :station_shows
  has_many :users, through: :station_shows
  has_many :show_genres
  has_many :genres, through: :show_genres
  belongs_to :channel
  accepts_nested_attributes_for :genres
  accepts_nested_attributes_for :station_shows

  validates :title, presence: true, uniqueness: { scope: :channel_id } # Validates uniqueness of title and channel
  validates :current_season, presence: true, numericality: { greater_than: 0 }

  def channel_name=(name)
    self.channel = Channel.find_or_create_by(name: name) unless name.blank?
  end

  def channel_name
    nil
  end

  def channel_attributes=(channel_attributes)
    channel_attributes.values.each do |channel_attribute|
      unless channel_attribute.blank?
        channel = Channel.find_or_create_by(name: channel_attribute)
        self.channel = channel
      end
    end
  end

  def genres_attributes=(genre_attributes)
    genre_name = genre_attributes["0"]["name"]
    unless genre_name.blank?
      genre = Genre.find_or_create_by(name: genre_name)
      self.genres << genre
    end
  end
end
