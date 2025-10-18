class Video < ApplicationRecord

  def youtube_embed_url
    youtube_id = youtube_url.split("v=").last
    "https://www.youtube.com/embed/#{youtube_id}"
  end
end
