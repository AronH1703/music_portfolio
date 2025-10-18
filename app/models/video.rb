require 'uri'
require 'cgi'

class Video < ApplicationRecord
  # Build a robust YouTube embed URL from various input formats:
  # - https://www.youtube.com/watch?v=VIDEO_ID[&...]
  # - https://youtu.be/VIDEO_ID[?t=...]
  # - https://www.youtube.com/embed/VIDEO_ID
  # - https://www.youtube.com/shorts/VIDEO_ID
  def youtube_embed_url
    id = extract_youtube_id(youtube_url)
    return "" if id.nil?
    "https://www.youtube.com/embed/#{id}"
  end

  private

  def extract_youtube_id(url)
    return nil if url.blank?

    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      return nil
    end

    host = uri.host.to_s
    path = uri.path.to_s

    id = nil

    if host.include?("youtu.be")
      # youtu.be/VIDEO_ID
      id = path.split("/").reject(&:blank?).first
    elsif host.include?("youtube.com")
      if path.start_with?("/embed/")
        # youtube.com/embed/VIDEO_ID
        id = path.split("/")[2]
      elsif path.start_with?("/shorts/")
        # youtube.com/shorts/VIDEO_ID
        id = path.split("/")[2]
      elsif path == "/watch"
        # youtube.com/watch?v=VIDEO_ID
        params = CGI.parse(uri.query.to_s)
        id = Array(params["v"]).first
      end
    end

    # Clean up any accidental trailing characters
    id&.to_s&.gsub(/[^0-9A-Za-z_-]/, "")
  end
end
