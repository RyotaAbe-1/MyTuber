# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@gmail.com",
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
    genre = Genre.find_by(genre_name: genres.sample)
    UserGenre.create!(user_id: user.id, genre_id: genre.id)
  end
end

first_user = User.first
last_user = User.last
first_genre = Genre.first
last_genre = Genre.last

200.times do
  follower = User.find(rand(first_user.id..last_user.id))
  followed = User.find(rand(first_user.id..last_user.id))
  if (follower != followed) && (Relationship.where(follower_id: follower.id, followed_id: followed.id).empty?)
    Relationship.create!(follower_id: follower.id, followed_id: followed.id)
  end
end

80.times do
  user = User.find(rand(first_user.id..last_user.id))
  genre = Genre.find(rand(first_genre.id..last_genre.id))
  Youtuber.create!(user_id: user.id, genre_id: genre.id, name: Faker::Lorem.characters(number: 10), evaluation: rand(1..5), content: Faker::Lorem.characters(number:100))
end

first_youtuber = Youtuber.first
last_youtuber = Youtuber.last

200.times do
  user = User.find(rand(first_user.id..last_user.id))
  youtuber = Youtuber.find(rand(first_youtuber.id..last_youtuber.id))
  Comment.create!(youtuber_id: youtuber.id, user_id: user.id, content: Faker::Lorem.characters(number: 50))
end