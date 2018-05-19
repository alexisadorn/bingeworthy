class StationShow < ApplicationRecord
  belongs_to :station
  belongs_to :show
  belongs_to :user

  validates :user_season, presence: true, numericality: true
  validate :user_season_vs_current_season

  def user_season_vs_current_season
    if user_season.presence > show.current_season
      errors.add(:user_season, "can't be ahead of the show's current season")
    end
  end
end
