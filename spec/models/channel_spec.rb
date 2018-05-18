require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "can be created" do
    channel = Channel.create(name: "ABC")
    expect(channel).to be_valid
  end
end
