class StationShow < ApplicationRecord
  belongs_to :station
  belongs_to :show
  belongs_to :user
end
