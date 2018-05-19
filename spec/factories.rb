FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :station do
    name "Must Watch"
    description "Shows that are popular"
    association :user, factory: :user
  end

  factory :show do
    title { Faker::Book.title }
    description { Faker::Movie.quote }
    association :channel, factory: :channel
    status "Currently Watching"
    day "Monday"
    time "9:00 PM"
    current_season { Faker::Number.between(1, 20) }
  end

  factory :channel do
    name "ABC"
  end
end
