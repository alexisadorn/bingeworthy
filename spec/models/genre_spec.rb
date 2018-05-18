require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "can be created" do
    genre = Genre.create(name: "Comedy")
    expect(genre).to be_valid
  end
end
