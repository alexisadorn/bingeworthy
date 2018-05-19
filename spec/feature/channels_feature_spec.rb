require 'rails_helper'

RSpec.feature "Channels#index", type: :feature do
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
