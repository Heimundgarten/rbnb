# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Boardgame.create(name:'Uno', description:'uno first game first game first game', year:2019, price_per_day: 1.23, photo: "uno.jpg")
Booking.create(total_price: 15, date_borrowed: "2019-05-19 00:46:03", date_returned: '2019-05-28 00:46:03', user_id: 1, boardgame_id:1)
Review.create(content: 'this is a wonderfull review of this particula game', rating:5, booking_id:1)

