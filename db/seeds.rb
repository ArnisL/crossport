# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create email: 'admin@mail.com', role: :admin, password: '123123'

if Rails.env.development?
  User.create email: 'customer@mail.com', role: :customer, password: '123123'
  User.create email: 'agent@mail.com', role: :agent, password: '123123'
  User.create email: 'arnis.lapsa@gmail.com', role: :customer, password: '123123'
end
