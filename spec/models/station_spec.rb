require 'rails_helper'

RSpec.describe Station, type: :model do
  before(:all) do
    @station1 = create(:station)
  end

  it 'is valid with valid attributes' do
    expect(@station1).to be_valid
  end

  it { is_expected.to belong_to :user }

  it 'should have many shows' do
    should have_many(:shows).
      through(:station_shows)
  end

  it { should validate_presence_of(:name) }
end
