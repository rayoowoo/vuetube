# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string           not null
#  user_id     :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string           not null
#  genre_id    :integer
#

class Video < ApplicationRecord
    validates :title, :description, :user_id, :url, presence: true

    belongs_to :uploader,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :genre, optional: true

    has_many :playlist_video_items
    has_many :playlists, through: :playlist_video_items, source: :playlist
end
