# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding DB"

["Section 10", "Section 20", "Section 50", "Section 80"].each do |ticket|
  Ticket.create!(title: ticket, price: rand(20..100), description: "Reserved seating for #{ticket}")
end

puts "Finished seeding"
