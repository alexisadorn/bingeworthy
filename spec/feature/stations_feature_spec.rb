require 'rails_helper'

RSpec.feature "Stations", type: :feature do
  describe 'Stations#index' do
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

  describe 'Stations#show' do
    it 'has a list of all shows in that station' do
      @station = Station.create(name: "Now Watching", user: create(:user))
      @show = create(:show, title: "Scandal")
      station_show = create(:station_show, station: @station, show: @show)
      visit station_path(@station)
      expect(page).to have_content("Now Watching")
      expect(page).to have_content("Scandal")
      expect(page).to have_content("ABC")
    end

    it 'links a show to its show page' do
      @station = Station.create(name: "Now Watching", user: create(:user))
      @show = create(:show, title: "Scandal")
      station_show = create(:station_show, station: @station, show: @show)
      visit station_path(@station)
      click_link("Scandal")
      expect(page.current_path).to eq show_path(@show)
    end

    it 'has a button to edit the station name' do
      @station = Station.create(name: "Now Watching", user: create(:user))
      @show = create(:show, title: "Scandal")
      station_show = create(:station_show, station: @station, show: @show)
      visit station_path(@station)
      expect(page).to have_selector(:link_or_button, 'Edit Station Name')
    end

    it 'has a button to delete the station' do
      @station = Station.create(name: "Now Watching", user: create(:user))
      @show = create(:show, title: "Scandal")
      station_show = create(:station_show, station: @station, show: @show)
      visit station_path(@station)
      expect(page).to have_selector(:link_or_button, 'Shut Down Station')
    end
  end
end
