class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_url

      t.timestamps
    end
  end
end


# 1. Open the Rails console by running the following command in your terminal:

# ----> "rails console " in the terminal

# 2. Create a new video object by running the following command in the Rails console:

# -----> video = Video.new(title: "My Video Title", youtube_url: "https://www.youtube.com/watch?v=example_id")
# video.save
