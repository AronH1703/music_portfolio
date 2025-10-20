# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding videos and newsletter subscribers..."

# Only wipe data in development to keep local DB clean during iterations.
if Rails.env.development?
  puts "[dev] Cleaning up old videos..."
  Video.destroy_all
  # puts "[dev] Cleaning up old newsletter subscribers..."
  # NewsletterSubscriber.destroy_all
end

puts "Upserting videos..."
[
  { title: "YOU - Aron Hannes(Unplugged)", youtube_url: "https://www.youtube.com/watch?v=KVr1b3-8zoY" },
  { title: "New Release", youtube_url: "https://www.youtube.com/watch?v=vyRz8e2NDFE" }
].each do |attrs|
  Video.find_or_create_by!(youtube_url: attrs[:youtube_url]) do |v|
    v.title = attrs[:title]
  end
end

puts "Upserting newsletter subscribers..."
%w[test@example.com hello@music.com fan@aronhannes.com].each do |email|
  NewsletterSubscriber.find_or_create_by!(email: email)
end

puts "Seeding completed! ✅"

# Optionally create an AdminUser via environment variables to avoid hardcoding secrets
if ENV["ADMIN_EMAIL"].present? && ENV["ADMIN_PASSWORD"].present?
  begin
    AdminUser.find_or_create_by!(email: ENV["ADMIN_EMAIL"]) do |u|
      u.password = ENV["ADMIN_PASSWORD"]
      u.password_confirmation = ENV["ADMIN_PASSWORD"]
    end
    puts "AdminUser ensured for #{ENV["ADMIN_EMAIL"]}"
  rescue => e
    warn "Failed to create AdminUser: #{e.message}"
  end
end

puts "Upserting songs (legacy hardcoded -> DB)..."
legacy_songs = [
  {
    title: "Vol. 1  Aron Hannes & Creature of Habit",
    slug:  "vol_1",
    asset_image_name: "EP 3 CLEAN COVER.png",
    coming_soon: true,
    release_date: Time.new(2025,10,27,12,0,0, "+01:00")
  },
  {
    title: "Scream - Aron Hannes ft. Diljá",
    slug:  "scream",
    asset_image_name: "SCREAM (BOLD:YELLOW).png",
    spotify_url: "https://open.spotify.com/track/072Mb8aj53aafCvbLf3dUW?si=2c4fb122fd014c5b",
    apple_music_url: "https://music.apple.com/is/album/scream-feat-dilj%C3%A1-single/1831948616",
    deezer_url: "https://link.deezer.com/s/31lBS1XJD7oJFryTxBzF9",
    tidal_url: "https://tidal.com/track/452642557",
    amazon_music_url: "https://amazon.com/music/player/tracks/B0FLH4NK94?marketplaceId=ATVPDKIKX0DER&musicTerritory=US&ref=dm_sh_aheslWzTaMhrJuk7EPkSDQjO5"
  },
  {
    title: "Little Me - Aron Hannes ft. Snny",
    slug:  "little-me",
    asset_image_name: "Little ME (excl. SNNY).png",
    spotify_url: "https://open.spotify.com/track/040XmcipGce3NYEKkJDgfa",
    apple_music_url: "https://geo.music.apple.com/nl/album/_/1796929157?app=music&at=1000lHKX&ct=linktree_http&i=1796929287&itscg=30200&itsct=lt_m&ls=1&mt=1",
    deezer_url: "https://www.deezer.com/track/476188905",
    tidal_url: "https://listen.tidal.com/album/418547352/track/418547353",
    amazon_music_url: "https://music.amazon.com/albums/B0DXJCLX4R?trackAsin=B0DXJ9KBC4",
    youtube_music_url: "https://music.youtube.com/watch?v=FDUUrfMfkRQ",
    soundcloud_url: "https://soundcloud.com/aronhannes/little-me"
  },
  {
    title: "Child - Aron Hannes",
    slug:  "child",
    asset_image_name: "Child New TEXT.png",
    spotify_url: "https://open.spotify.com/track/4krgdvPJd5VaCqeVQ7pux3",
    apple_music_url: "https://music.apple.com/us/album/child/1702521356?i=1702521361",
    deezer_url: "https://www.deezer.com/track/476188905",
    tidal_url: "https://tidal.com/browse/track/310739997",
    amazon_music_url: "https://music.amazon.com/albums/B0CFM5H6QG",
    youtube_music_url: "https://music.youtube.com/watch?v=j5y1_QjBugA",
    soundcloud_url: "https://soundcloud.com/aronhannes/child"
  },
  {
    title: "Those Were The Times - INKT ft. Aron Hannes",
    slug:  "those-were-the-times",
    asset_image_name: "twtt.jpg",
    spotify_url: "https://open.spotify.com/track/2vQwvuPDgsxyJyzsg8bKNG?si=f86bffca758347a2",
    apple_music_url: "https://music.apple.com/us/album/those-were-the-times-single/1699380849",
    deezer_url: "https://deezer.page.link/HTzVk7THkqZ98qBV9",
    tidal_url: "https://tidal.com/browse/track/307289435",
    amazon_music_url: "https://music.amazon.com/tracks/B0CCVR2SLY?marketplaceId=A3K6Y4MI8GDYMT&musicTerritory=NL&ref=dm_sh_x6K7RPbaKfzJU7Q57T9hxcVjI"
  },
  {
    title: "Twenties - Aron Hannes",
    slug:  "twenties-album",
    asset_image_name: "Twenties art final.jpg",
    spotify_url: "https://open.spotify.com/album/3udzLBW2ax27oLtvTEW2Ac?si=dHY1ua6GRcuEr6_c7fjONA",
    apple_music_url: "https://music.apple.com/us/album/twenties-ep/1642285479",
    deezer_url: "https://deezer.page.link/WTZ3432eWX3USLuW6",
    tidal_url: "https://tidal.com/browse/album/245472703",
    amazon_music_url: "https://music.amazon.com/albums/B0BC8L8G4R?marketplaceId=A3K6Y4MI8GDYMT&musicTerritory=NL&ref=dm_sh_kgctZjyJE4GqmR4HqRSt6XyJy"
  }
]

legacy_songs.each do |attrs|
  song = Song.find_or_initialize_by(slug: attrs[:slug])
  song.assign_attributes(attrs.except(:slug))
  song.save!
end

puts "Songs upserted."
