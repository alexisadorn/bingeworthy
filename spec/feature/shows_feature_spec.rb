require 'rails_helper'

RSpec.feature "Shows#index", type: :feature do
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
