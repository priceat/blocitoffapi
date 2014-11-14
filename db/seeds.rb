require 'faker'
 
User.destroy_all
List.destroy_all
Task.destroy_all

 5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


 10.times do
   List.create!(
     user: users.sample,
     title:  Faker::Lorem.sentence,
     description:   Faker::Lorem.paragraph
   )
 end
 lists = List.all
 
 100.times do
   Task.create!(
     list: lists.sample,
     body: Faker::Lorem.paragraph,
     overdue: false
   )
 end

 User.first.update_attributes!(
  email: 'priceat@gmail.com',
  password: 'helloworld'
  )
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{List.count} lists created"
 puts "#{Task.count} tasks created"