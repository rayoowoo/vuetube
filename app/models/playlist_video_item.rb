# == Schema Information
#
# Table name: playlist_video_items
#
#  id          :integer          not null, primary key
#  playlist_id :integer
#  video_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PlaylistVideoItem < ApplicationRecord
    validates :playlist_id, :video_id, presence: true;

    belongs_to :playlist
    belongs_to :video
end
