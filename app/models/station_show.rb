class StationShow < ApplicationRecord
  belongs_to :station
  belongs_to :show
  belongs_to :user

  validates :user_status, presence: true
  validates :user_season, presence: true
end
