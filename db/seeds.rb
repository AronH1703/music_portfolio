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

 
