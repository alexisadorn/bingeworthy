require 'rails_helper'

RSpec.feature "Stations#index", type: :feature do
  it 'has a list of all stations' do
    @station = Station.create(name: "Now Watching", user: create(:user))
    visit stations_path
    expect(page).to have_content("Now Watching")
  end

  it 'links a station to its show page' do
    @station = Station.create(name: "Now Watching", user: create(:user))
    visit stations_path
    click_link("Now Watching")
    expect(page.current_path).to eq station_path(@station)
  end

  it 'has a button to create a new station' do
    visit stations_path
    expect(page).to have_selector(:link_or_button, 'Start a new Station')
  end

  it 'has a button to view all shows' do
    visit stations_path
    expect(page).to have_selector(:link_or_button, 'Find more shows to add to my stations')
  end
end
