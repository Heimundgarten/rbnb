# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
categories = ["chinese", "italian", "japanese", "french", "belgian"]

10.times do
  restaurant = Restaurant.create(
    name: Faker::Name.name.capitalize,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )

  # rand(5..10).times do
  #   review = Review.create(
  #     content: Faker::Movies::VForVendetta.quote,
  #     rating: rand(1..10)
  #   )
  # end
end
puts 'Finished!'


require "faker"

# TODO: Write a seed to insert 100 posts in the database

puts 'Creating 100 fake posts...'
100.times do
  post = Post.new(
    title: Faker::Movies::VForVendetta.character,
    url: Faker::Movies::VForVendetta.speech
  )
  post.save!
end
