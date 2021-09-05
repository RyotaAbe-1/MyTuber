FactoryBot.define do
  factory :user do
    user_name { Faker::Lorem.characters(number:12) }
    email { Faker::Lorem.characters(number:20) }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    
  end
end