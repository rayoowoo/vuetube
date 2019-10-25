# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Video.delete_all


ruiyu = User.create!(username: "rayoowooh", password: "rayoowooh", first_name: "Ruiyu", last_name: "Wu");

video1 = Video.create!(title: "More", description: "you wanted more?????", url: "https://www.youtube.com/watch?v=jHUnLSQVtrA", user_id: ruiyu.id)
video2 = Video.create!(title: "We fight", description: "Team Cap vs Team Iron Man", url: "https://www.youtube.com/watch?v=cfVY9wLKltA", user_id: ruiyu.id)