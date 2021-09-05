FactoryBot.define do
  factory :user do
    user_name { Faker::Lorem.characters(number:12) }
    email { "#{Faker::Lorem.characters(number:10)}@gmail.com"}
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    introduce {Faker::Lorem.characters(number:100)}
  end
end