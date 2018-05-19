require 'rails_helper'

RSpec.describe StationShow, type: :model do
  before(:all) do
    @station_show = create(:station_show)
  end

  it 'is valid with valid attributes' do
    expect(@station_show).to be_valid
  end

  it { is_expected.to belong_to :station }

  it { is_expected.to belong_to :show }

  it { is_expected.to belong_to :user }

  it { should validate_presence_of(:user_status) }

  it { should validate_presence_of(:user_season) }
end
