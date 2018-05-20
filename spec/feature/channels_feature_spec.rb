require 'rails_helper'

RSpec.feature "Channels", type: :feature do
  describe "Channels#index" do
    it 'has a list of all channels' do
      @channel = Channel.create(name: "FOX")
      visit channels_path
      expect(page).to have_content("FOX")
    end

    it 'links a channel to its show page' do
      @channel = Channel.create(name: "FOX")
      visit channels_path
      click_link("FOX")
      expect(page.current_path).to eq channel_path(@channel)
    end
  end

  describe "Channels#show" do
    it 'has a list of all the channel\'s shows' do
      @show = create(:show, title: "Once Upon a Time")
      @channel = @show.channel
      visit channel_path(@channel)
      expect(page).to have_content("Once Upon a Time")
    end

    it 'links a show to the show\'s show page' do
      @show = create(:show, title: "Once Upon a Time")
      @channel = @show.channel
      visit channel_path(@channel)
      click_link("Once Upon a Time")
      expect(page.current_path).to eq show_path(@show)
    end
  end
end
