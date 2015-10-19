class AddSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_title
      t.string :author
      t.string :url
      t.timestamp :created_at
      t.timestamp :update_at

    end
  end
end
