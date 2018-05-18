require 'rails_helper'

RSpec.describe Station, type: :model do
  it "can be created" do
    user = User.create(email: 'test@123.com', password: 'test123')
    station = Station.create(name: 'My Station', user: user)
    expect(station).to be_valid
  end
end
