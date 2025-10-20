class Song < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end

  def links_hash
    {
      "Spotify" => spotify_url,
      "Apple Music" => apple_music_url,
      "Deezer" => deezer_url,
      "Tidal" => tidal_url,
      "Amazon Music" => amazon_music_url,
      "YouTube Music" => youtube_music_url,
      "SoundCloud" => soundcloud_url
    }.compact_blank
  end

  def has_asset_image?
    asset_image_name.present?
  end
end
