# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableTagGossip.destroy_all
Message.destroy_all


10.times do
 city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
 user = User.create(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name, description: Faker::Friends.quote, email: Faker::Internet.email, age: Faker::Number.number(2), city: City.all.sample, password: "coucou")
end

20.times do
 gossip = Gossip.create(title: Faker::Lorem.word, content: Faker::FamousLastWords.last_words, user: User.all.sample)
end

10.times do
tag = Tag.create(title: Faker::Ancient.hero)
end

10.times do
join_table_tag_gossip = JoinTableTagGossip.create(gossip: Gossip.all.sample, tag: Tag.all.sample)
end

5.times do
 message = Message.create(content: Faker::FamousLastWords.last_words, recipient: User.all.sample, sender: User.all.sample)
end


