# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
include Faker
20.times do
     Classified.create(
      title: Faker::Book.title,
      price: Faker::Number.decimal(2,2),
      location: Faker::Address.city,
      description: Faker::Lorem.sentence,
      email: Faker::Internet.email,
      category_id: Faker::Number.between(1,11),
      user_id:Faker::Number.between(1,3)
     )
     end
