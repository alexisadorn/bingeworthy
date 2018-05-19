FactoryBot.define do

  factory :user do
    email "bob@gmail.com"
    password "test12345"
  end

  factory :station do
    name "Must Watch"
    description "Shows that are popular"
    association :user, factory: :user
  end
end
