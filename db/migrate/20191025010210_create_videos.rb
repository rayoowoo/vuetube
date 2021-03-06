class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :user_id, null: false
      t.timestamps
    end
    add_index :videos, :title
  end
end
