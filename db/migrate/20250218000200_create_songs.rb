class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :spotify_url
      t.string :apple_music_url
      t.string :deezer_url
      t.string :tidal_url
      t.string :amazon_music_url
      t.string :youtube_music_url
      t.string :soundcloud_url
      t.timestamps
    end
    add_index :songs, :slug, unique: true
  end
end

