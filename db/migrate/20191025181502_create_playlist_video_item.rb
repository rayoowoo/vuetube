class CreatePlaylistVideoItem < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_video_items do |t|
      t.integer :playlist_id
      t.integer :video_id
      t.timestamps
    end
    add_index :playlist_video_items, :playlist_id
    add_index :playlist_video_items, :video_id
    add_index :playlist_video_items, [:playlist_id, :video_id], unique: true;
  end
end
