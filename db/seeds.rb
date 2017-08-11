5.times do  
	Course.create!(
  	name: Faker::Lorem.word,  
  	description: Faker::Lorem.sentence(3, true, 4)  
 	)
end

10.times do  
 	Student.create!(
  	name: Faker::Name.name
 	)
end

puts "Seed finished"
puts "#{Course.count} courses created"
puts "#{Student.count} students created"
