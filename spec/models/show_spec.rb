require 'rails_helper'

RSpec.describe Show, type: :model do
  it "can be created" do
    channel = Channel.create(name: "FX")
    genre = Genre.create(name: "Drama")
    show = Show.new( title: 'The Americans',
                        description: 'Two Soviet KGB officers posting as an American married couple',
                        status: 'Currently On',
                        day: 'Wednesday',
                        time: '9:00 PM',
                        current_season: 6 )
    show.channel = channel
    show.genres << genre
    show.save
    expect(show).to be_valid
  end
end
