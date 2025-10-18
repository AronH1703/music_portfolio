# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning up old videos..."
Video.destroy_all

puts "Creating new videos..."
Video.create!(
  title: "YOU - Aron Hannes(Unplugged)",
  youtube_url: "https://www.youtube.com/watch?v=KVr1b3-8zoY"
)

Video.create!(
  title: "New Release",
  youtube_url: "https://www.youtube.com/watch?v=vyRz8e2NDFE"
)

puts "Seeding completed! ✅"

# puts "Cleaning up old newsletter subscribers..."
# NewsletterSubscriber.destroy_all

# puts "Creating new newsletter subscribers..."
# NewsletterSubscriber.create!(email: "test@example.com") # Test email
# NewsletterSubscriber.create!(email: "hello@music.com")
# NewsletterSubscriber.create!(email: "fan@aronhannes.com")

# puts "Seeding completed! ✅"
