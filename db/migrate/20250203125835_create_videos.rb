class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_url

      t.timestamps
    end
  end
end
