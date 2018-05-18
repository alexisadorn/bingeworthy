require 'rails_helper'

RSpec.describe StationShow, type: :model do
  it "can be created" do
    user = User.create(email: 'test@123.com', password: 'test123')
    station = Station.create(name: 'My Station', user: user)
    channel = Channel.create(name: "FX")
    genre = Genre.create(name: "Drama")
    show = Show.new( title: 'The Americans',
                        description: 'Two Soviet KGB officers posting as an American married couple',
                        channel: channel,
                        status: 'Currently On',
                        day: 'Wednesday',
                        time: '9:00 PM',
                        current_season: 6 )
    show.genres << genre
    show.save
    station_show = StationShow.create(station: station, show: show, user: user, user_status: 'Currently Watching', user_season: 1)
    expect(station_show).to be_valid
  end
end
