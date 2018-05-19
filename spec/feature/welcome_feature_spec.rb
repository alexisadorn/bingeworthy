require 'rails_helper'

RSpec.feature "Welcome#index", type: :feature do
  it 'has a button to log in' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'Log In')
  end

  it 'has a button to sign up' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'Sign Up')
  end
end
