

puts 'Cleaning database...'
# Boardgame.destroy_all
# Review.destroy_all
# Booking.destroy_all
# sleep(2)
# puts 'Creating user...'
# 15.times do
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     address: Faker::Address.full_address,
#     email: Faker::Internet.free_email,
#     created_at: Faker::Date.backward(54321),
#     encrypted_password: Faker::Internet.password,
#     photo: Faker::Placeholdit.image('50x50', 'jpg')
#   )
#   user.save!
# end


sleep(2)
puts 'Creating boardgames...'
10.times do
  boardgame = Boardgame.create(
    name: Faker::Games::Zelda.game,
    description: Faker::Movies::VForVendetta.speech,
    year: Faker::Date.backward(54321),
    price_per_day: Faker::Number.within(1..10),
    user_id: rand(1..2),
    photo: Faker::Placeholdit.image('50x50', 'jpg'),
    created_at: Faker::Date.backward(54321)
  )
  boardgame.save!
end

sleep(2)
puts 'Creating bookings...'
10.times do
  booking = Booking.new(
    total_price: Faker::Number.within(10..30),
    date_borrowed:Faker::Date.between_except(1.year.ago, 20.days.ago, 21.days.ago),
    date_returned:Faker::Date.between_except(19.days.ago, 2.days.ago, Date.today),
    user_id: rand(1..2),
    boardgame_id: rand(1..3),
    created_at: Faker::Date.backward(54321)
  )
  booking.save!
end

sleep(2)
puts 'Creating reviews...'
rand(4..8).times do
  review = Review.create(
    content: Faker::Movies::VForVendetta.quote,
    rating: rand(1..5),
    booking_id: rand(1..20)
  )
end

puts 'Finished!'
