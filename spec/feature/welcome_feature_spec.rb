require 'rails_helper'

RSpec.feature "Welcome#index", type: :feature do
  it 'links to the log in page' do
    visit '/'
    click_link("Log In")
    expect(page.current_path).to eq login_path
  end

  it 'links to the sign up page' do
    visit '/'
    click_link("Sign Up")
    expect(page.current_path).to eq new_user_path
  end
end
