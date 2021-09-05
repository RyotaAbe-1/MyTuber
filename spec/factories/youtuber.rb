FactroryBot.define do
  factory :youtuber do
    name { Faker::Lorem.characters(number:12) }
    evaluatin { Faker::Lorem.characters(number:3.5) }
    content { Faker::Lorem.cheracters(number:50) }
  end
end