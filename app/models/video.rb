class Video < ApplicationRecord
    validates :title, :description, :user_id, :url, presence: true

    belongs_to :uploader,
        foreign_key: :user_id,
        class_name: :User
end