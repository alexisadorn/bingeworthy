require 'rails_helper'

RSpec.describe "Feature Test: Login", type: :feature do
  it "successfully logs in a user" do
    user = create(:user, email: 'user@gmail.com', password: '12345')
    visit '/login'
    fill_in("session[email]", :with => "user@gmail.com")
    fill_in("session[password]", :with => "12345")
    click_button('Login')
    expect(current_path).to eq('/watchlists')
  end
end
