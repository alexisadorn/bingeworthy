FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :station do
    name { Faker::Hipster.sentence(3) }
    description { Faker::Hipster.sentence }
    association :user, factory: :user
  end

  factory :show do
    title { Faker::Book.title }
    description { Faker::Hipster.sentence }
    association :channel, factory: :channel
    status "Currently Watching"
    day "Monday"
    time "9:00 PM"
    current_season { Faker::Number.between(1, 20) }
  end

  factory :channel do
    name "ABC"
  end

  factory :genre do
    name { Faker::Book.genre }
  end

  factory :station_show do
    association :station, factory: :station
    association :show, factory: :show
    association :user, factory: :user
    user_status "Not Started"
    user_season { Faker::Number.between(1, 20) }
  end
end
