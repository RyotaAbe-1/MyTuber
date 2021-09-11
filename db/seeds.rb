# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "sample@gmail.com",
  password: "111111",
  password_confirmation: "111111"
)



genres = ["お笑い", "政治", "ビジネス", "やってみた系", "ゲーム", "音楽", "料理", "旅行", "投資", "IT・技術", "車", "動物", "ファッション", "キャンプ", "商品", "キッズ", "美容", "漫画・アニメ", "筋トレ", "VTuber", "映画", "スポーツ", "芸能人", "釣り", "パチンコ", "競馬", "教育", "植物", "虫", "宗教"]
genres.each do |genre|
  Genre.create!(genre_name: genre, application_status: true)
end

users = ("a".."z").to_a
users.each do |user|
  user = User.create!(user_name: Faker::Name.name, email: "#{user}@gmail.com", password: "111111", password_confirmation: "111111", introduce: Faker::Lorem.characters(number: 50))
  rand(1..10).times do
    # number_of_genres = Genre.count
    # genre = Genre.find(rand(1..number_of_genres))
    genre = Genre.find_by(genre_name: genres.sample)
    UserGenre.create!(user_id: user.id, genre_id: genre.id)
  end
end

20.times do
  number_of_users = User.count
  user = User.find(rand(1..number_of_users))
  number_of_genres = Genre.count
  genre = Genre.find(rand(1..number_of_genres))
  Youtuber.create!(user_id: user.id, genre_id: genre.id, name: Faker::Lorem.characters(number: 10), evaluation: rand(1..5), content: Faker::Lorem.characters(number:100))
end

50.times do
  number_of_users = User.count
  user = User.find(rand(1..number_of_users))
  number_of_youtubers = Youtuber.count
  youtuber = Youtuber.find(rand(1..number_of_youtubers))
  Comment.create!(youtuber_id: youtuber.id, user_id: user.id, content: Faker::Lorem.characters(number: 50))
end