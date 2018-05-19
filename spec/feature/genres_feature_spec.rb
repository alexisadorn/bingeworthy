require 'rails_helper'

RSpec.feature "Genres#index", type: :feature do
  it 'has a list of all genres' do
    @genre = Genre.create(name: "Romance")
    visit genres_path
    expect(page).to have_content("Romance")
  end

  it 'links a genre to its show page' do
    @genre = Genre.create(name: "Romance")
    visit genres_path
    click_link("Romance")
    expect(page.current_path).to eq genre_path(@genre)
  end
end
