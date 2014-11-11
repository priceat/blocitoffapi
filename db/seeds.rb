require 'faker'
 
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
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 lists = List.all
 
 100.times do
   Task.create!(
     list: lists.sample,
     body: Faker::Lorem.paragraph
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