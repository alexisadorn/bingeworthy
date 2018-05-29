require 'rails_helper'

RSpec.describe "Feature Test: Signup", type: :feature do
  it "successfully creates a user" do
    visit '/signup'
    fill_in("user[email]", :with => "user@gmail.com")
    fill_in("user[username]", :with => "John Doe")
    fill_in("user[password]", :with => "12345")
    fill_in("user[password_confirmation]", :with => "12345")
    click_button('Create my account')
    expect(current_path).to eq('/stations')
  end
end
