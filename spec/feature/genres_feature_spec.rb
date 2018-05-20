require 'rails_helper'

RSpec.feature "Genres", type: :feature do
  describe 'Genres#index' do
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

  describe "Genres#show" do
    it 'has a list of all the genre\'s shows' do
      @show = create(:show, title: "Once Upon a Time")
      @genre = @show.genres.create(name: "Fantasy")
      visit genre_path(@genre)
      expect(page).to have_content("Once Upon a Time")
    end

    it 'links a show to the show\'s show page' do
      @show = create(:show, title: "Once Upon a Time")
      @genre = @show.genres.create(name: "Fantasy")
      visit genre_path(@genre)
      click_link("Once Upon a Time")
      expect(page.current_path).to eq show_path(@show)
    end
  end
end
