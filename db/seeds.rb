# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying all previous restaurants..."
Restaurant.destroy_all

puts "creating new restaurants..."
puts "and adding reviews..."
50.times do |variable|
  @restaurant = Restaurant.create(
{
  name: Faker::Coffee.blend_name,
  address: Faker::Coffee.origin,
  phone_number: Faker::PhoneNumber.cell_phone,
  category: ["chinese", "italian", "japanese", "french", "belgian"].sample
})

5.times do
  Review.create({
    restaurant_id: @restaurant.id,
    content: Faker::RickAndMorty.quote,
    rating: rand(0..5)
  })
end
end
