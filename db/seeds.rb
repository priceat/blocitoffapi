require 'faker'
 

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
 
 puts "Seed finished"
 puts "#{List.count} lists created"
 puts "#{Task.count} tasks created"