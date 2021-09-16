FactoryBot.define do
  factory :youtuber do
    name { Faker::Lorem.characters(number: 12) }
    evaluation { Faker::Lorem.characters(number: 3.5) }
    content { Faker::Lorem.characters(number: 100) }

    association :user
    association :genre
  end
end
