FactoryBot.define do
  factory :favorite do
    association :user
    association :youtuber
  end
end
