require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created" do
    user = User.create(email: "test@123.com", password: "test123")
    expect(user).to be_valid
  end
end
