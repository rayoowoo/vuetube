class Genre < ApplicationRecord
    validates :name, presence: true

    has_many :videos
end