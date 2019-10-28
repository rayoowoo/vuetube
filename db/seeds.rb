# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Video.delete_all
Playlist.delete_all
PlaylistVideoItem.delete_all


ruiyu = User.create!(username: "rayoowooh", password: "rayoowooh", first_name: "Ruiyu", last_name: "Wu");

video1 = Video.create!(title: "More", description: "you wanted more?????", url: "https://www.youtube.com/embed/jHUnLSQVtrA", user_id: ruiyu.id)
video2 = Video.create!(title: "We fight", description: "Team Cap vs Team Iron Man", url: "https://www.youtube.com/embed/cfVY9wLKltA", user_id: ruiyu.id)

playlist1 = Playlist.create!(name: "Playlist 1", user_id: ruiyu.id)
playlist2 = Playlist.create!(name: "Playlist 2", user_id: ruiyu.id)

playlist_video_item1 = PlaylistVideoItem.create!(playlist_id: playlist1.id, video_id: video1.id)
playlist_video_item2 = PlaylistVideoItem.create!(playlist_id: playlist1.id, video_id: video2.id)
playlist_video_item3 = PlaylistVideoItem.create!(playlist_id: playlist2.id, video_id: video1.id)
playlist_video_item4 = PlaylistVideoItem.create!(playlist_id: playlist2.id, video_id: video2.id)