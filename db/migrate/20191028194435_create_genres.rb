class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps
    end

    add_column :videos, :genre_id, :integer
  end
end
