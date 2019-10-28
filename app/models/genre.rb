# == Schema Information
#
# Table name: genres
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Genre < ApplicationRecord
    validates :name, presence: true

    has_many :videos
end
