# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database'

User.destroy_all
Channel.destroy_all
Message.destroy_all

puts 'seeding database users'

user1 = User.create!(email: 'majid@gmail.com', password: '123456789')
user2 = User.create!(email: 'yasmine@gmail.com', password: '123456789')

users = [user1, user2]

puts 'seeding database channels'

channel1 = Channel.create!(name: 'general')
channel2 = Channel.create!(name: 'react')
channel3 = Channel.create!(name: 'casablanca')

channels = [channel1, channel2, channel3]

puts 'seeding database messages'

10.times do
  channels.each do |channel|
    Message.create!(user_id: users.sample.id, channel_id: channel.id, content: Faker::FamousLastWords.last_words )
  end
end

puts 'seed finished'
