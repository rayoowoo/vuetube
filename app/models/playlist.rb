# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Playlist < ApplicationRecord
    validates :name, :user_id, presence: true;

    has_many :playlist_video_items
    has_many :videos, through: :playlist_video_items, source: :video
end
