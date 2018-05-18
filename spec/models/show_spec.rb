require 'rails_helper'

RSpec.describe Show, type: :model do
  it "can be created" do
    show = Show.create( title: 'The Americans',
                        description: 'Two Soviet KGB officers posting as an American married couple',
                        genre: 'Drama',
                        channel: 'FX',
                        status: 'Currently On',
                        day: 'Wednesday',
                        time: '9:00 PM',
                        current_season: 6 )
    expect(show).to be_valid
  end
end
