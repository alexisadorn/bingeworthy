require 'rails_helper'

RSpec.feature "Shows", type: :feature do
  describe 'Shows#index' do
    it 'has a list of all shows' do
      @show = Show.create(title: "Fargo", channel: create(:channel), current_season: 15)
      visit shows_path
      expect(page).to have_content("Fargo")
    end

    it 'links a show to its show page' do
      @show = Show.create(title: "Fargo", channel: create(:channel), current_season: 15)
      visit shows_path
      click_link("Fargo")
      expect(page.current_path).to eq show_path(@show)
    end
  end

  describe 'Shows#show' do
    it 'lists all details of a show' do
      @show = Show.create(title: "Scandal",
                          description: "A powerful team of Washington, D.C. lawyers makes scandals disappear while handling goverment crises.",
                          channel: Channel.create(name: "ABC"),
                          day: "Thur",
                          time: "8:00 PM",
                          current_season: 7)
      @show.genres << Genre.create(name: "Drama")
      visit show_path(@show)
      expect(page).to have_content("A powerful team of Washington, D.C. lawyers makes scandals disappear while handling goverment crises.")
      expect(page).to have_content("Channel: ABC")
      expect(page).to have_content("Day: Thur")
      expect(page).to have_content("Time: 8:00 PM")
      expect(page).to have_content("Current Season: 7")
      expect(page).to have_content("Genres: Drama,")
    end

    it 'has a button to add the show to my station' do
      @show = Show.create(title: "Scandal",
                          description: "A powerful team of Washington, D.C. lawyers makes scandals disappear while handling goverment crises.",
                          channel: Channel.create(name: "ABC"),
                          day: "Thur",
                          time: "8:00 PM",
                          current_season: 7)
      @show.genres << Genre.create(name: "Drama")
      visit show_path(@show)
      expect(page).to have_selector(:link_or_button, 'Add To My Station')
    end

    it 'has a button to move the show from my station' do
      @show = Show.create(title: "Scandal",
                          description: "A powerful team of Washington, D.C. lawyers makes scandals disappear while handling goverment crises.",
                          channel: Channel.create(name: "ABC"),
                          day: "Thur",
                          time: "8:00 PM",
                          current_season: 7)
      @show.genres << Genre.create(name: "Drama")
      visit show_path(@show)
      expect(page).to have_selector(:link_or_button, 'Move to Different Station')
    end

    it 'has a button to move the show from my station' do
      @show = Show.create(title: "Scandal",
                          description: "A powerful team of Washington, D.C. lawyers makes scandals disappear while handling goverment crises.",
                          channel: Channel.create(name: "ABC"),
                          day: "Thur",
                          time: "8:00 PM",
                          current_season: 7)
      @show.genres << Genre.create(name: "Drama")
      visit show_path(@show)
      expect(page).to have_selector(:link_or_button, 'Already in Station - Remove?')
    end

    it 'has a button to update show details' do
      @show = Show.create(title: "Scandal",
                          description: "A powerful team of Washington, D.C. lawyers makes scandals disappear while handling goverment crises.",
                          channel: Channel.create(name: "ABC"),
                          day: "Thur",
                          time: "8:00 PM",
                          current_season: 7)
      @show.genres << Genre.create(name: "Drama")
      visit show_path(@show)
      expect(page).to have_selector(:link_or_button, 'Update show details')
    end

    it 'only users who created the show can edit it' do

    end
  end
end
