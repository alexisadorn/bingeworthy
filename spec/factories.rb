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
end
