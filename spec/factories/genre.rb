FactoryBot.define do
  factory :genre do
    genre_name { Faker::Lorem.characters(number:12) }
  end
end