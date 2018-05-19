require 'rails_helper'

RSpec.describe Show, type: :model do
  before(:all) do
    @show1 = create(:show)
    @user1 = create(:user)
    @station1 = create(:station)
    @show1.genres.create([{name: "Drama"}, {name: "Adventure"}])
    StationShow.create( station: @station1,
                        show: @show1,
                        user: @user1)
  end

  it 'is valid with valid attributes' do
    expect(@show1).to be_valid
  end

  it { is_expected.to belong_to :channel }

  it 'has many stations' do
    should have_many(:stations).
    through (:station_shows)
  end

  it 'has many users' do
    should have_many(:users).
    through (:station_shows)
  end

  it 'has many genres' do
    should have_many(:genres).
    through (:show_genres)
  end

  it { should validate_presence_of(:title) }
end
