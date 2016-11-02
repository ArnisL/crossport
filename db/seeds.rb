# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create email: 'admin@mail.com', role: :admin, password: '123123'

if Rails.env.development?
  customer = User.create email: 'customer@mail.com', role: :customer, password: '123123'
  agent = User.create email: 'agent@mail.com', role: :agent, password: '123123'
  me = User.create email: 'arnis.lapsa@gmail.com', role: :customer, password: '123123'

  customer.tickets.create \
    title: 'Has Anyone Really Been Far Even as Decided to Use Even Go Want to do Look More Like?',
    description: 'still appears nowhere',
    created_at: Time.now - 5.days

  me.tickets.create \
    title: 'i like turtles',
    description: 'still appears nowhere',
    created_at: Time.now - 6.days

  customer.tickets.create \
    title: 'help me with windows',
    description: 'lorem ipsum',
    created_at: Time.now - 10.days

  customer.tickets.create \
    title: 'i have an issue with Windows Vista!!!11',
    description: 'lorem ipsum',
    created_at: Time.now - 11.days

  me.tickets.create \
    title: 'i like turtles',
    description: 'still appears nowhere',
    created_at: Time.now - 15.days

  customer.tickets.create \
    title: 'windows throws an error',
    description: 'lorem ipsum',
    created_at: Time.now - 30.days

  customer.tickets.create \
    title: 'how to windows?',
    description: 'lorem ipsum',
    created_at: Time.now - 5.months
end
