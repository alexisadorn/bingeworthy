require 'rails_helper'

RSpec.feature "Watchlists", type: :feature do
  before(:each) do
    @user = create(:user)
    visit '/login'
    fill_in("session[email]", :with => @user.email)
    fill_in("session[password]", :with => @user.password)
    click_button('Login')
  end

  describe 'Watchlists#index' do
    it 'has a list of all watchlists' do
      @watchlist = Watchlist.create(name: "Now Watching", user: @user)
      visit watchlists_path
      expect(page).to have_content("Now Watching")
    end

    it 'links a watchlist to its show page' do
      @watchlist = Watchlist.create(name: "Now Watching", user: @user)
      visit watchlists_path
      click_link("Now Watching")
      expect(page.current_path).to eq watchlist_path(@watchlist)
    end

    it 'has a button to create a new watchlist' do
      visit watchlists_path
      expect(page).to have_selector(:link_or_button, 'Create a new Watchlist')
    end

    it 'has a button to view all shows' do
      visit watchlists_path
      expect(page).to have_selector(:link_or_button, 'Add Shows')
    end
  end

  describe 'Watchlists#show' do
    it 'has a list of all shows in that watchlist' do
      @watchlist = Watchlist.create(name: "Now Watching", user: @user)
      @show = create(:show, title: "Scandal")
      listing = create(:listing, watchlist: @watchlist, show: @show)
      visit watchlist_path(@watchlist)
      expect(page).to have_content("Now Watching")
      expect(page).to have_content("Scandal")
      expect(page).to have_content("ABC")
    end

    it 'links a show to its show page' do
      @watchlist = Watchlist.create(name: "Now Watching", user: @user)
      @show = create(:show, title: "Scandal")
      listing = create(:listing, watchlist: @watchlist, show: @show)
      visit watchlist_path(@watchlist)
      click_link("Scandal")
      expect(page.current_path).to eq show_path(@show)
    end

    it 'has a button to edit the watchlist name' do
      @watchlist = Watchlist.create(name: "Now Watching", user: @user)
      @show = create(:show, title: "Scandal")
      listing = create(:listing, watchlist: @watchlist, show: @show)
      visit watchlist_path(@watchlist)
      expect(page).to have_selector(:link_or_button, 'Edit Watchlist Name')
    end

    it 'has a button to delete the watchlist' do
      @watchlist = Watchlist.create(name: "Now Watching", user: @user)
      @show = create(:show, title: "Scandal")
      listing = create(:listing, watchlist: @watchlist, show: @show)
      visit watchlist_path(@watchlist)
      expect(page).to have_selector(:link_or_button, 'Delete Watchlist')
    end
  end
end
