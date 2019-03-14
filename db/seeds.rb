# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'host@example.com',
  password: 'password'
           )

babby = User.first.events.new(name: "Babby's first event",
                              description: 'My first event!',
                              starts_at: 1.day.from_now,
                              ends_at: 26.hours.from_now)
babby.save!
babby.attendings.create!(user: User.first, role: 'host')

(1..3).each do |x|
  u = User.create(
    email: "user#{x}@example.com",
    password: 'password'
  )
  babby.attendings.create!(user: u, role: 'attendee')
end

bruh = User.second.events.new(name: "USER 1 event!!",
                              description: 'Event for others',
                              starts_at: 1.day.ago, ends_at: 22.hours.ago)

bruh.save!
bruh.attendings.create!(user: User.second, role: 'host')
bruh.attendings.create!(user: User.first, role: 'attendee')
