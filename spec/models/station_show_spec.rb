require 'rails_helper'

RSpec.describe StationShow, type: :model do
  before(:all) do
    @station_show1 = create(:station_show)
  end

  it 'is valid with valid attributes' do
    expect(@station_show1).to be_valid
  end

  it { is_expected.to belong_to :station }

  it { is_expected.to belong_to :show }

  it { is_expected.to belong_to :user }

  it 'is not valid if the season is not a number' do
    station_show2 = build(:station_show, user_season: "Fred")
    expect(station_show2).to_not be_valid
  end

  it 'is not valid if the user\'s season is ahead of current season' do
    show = create(:show, current_season: 3)
    station_show2 = build(:station_show, show: show, user_season: 5)
    expect(station_show2).to_not be_valid
  end
end
