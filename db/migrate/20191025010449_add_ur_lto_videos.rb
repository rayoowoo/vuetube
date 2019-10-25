class AddUrLtoVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :url, :string, null: false
  end
end
