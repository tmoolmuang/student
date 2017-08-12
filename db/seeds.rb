3.times do  
 	Student.create!(
  	name: Faker::Name.name
 	)
end
students = Student.all

5.times do  
	Course.create!(
  	name: Faker::Lorem.word,  
  	description: Faker::Lorem.sentence(3, true, 4)  
 	)
end
courses = Course.all

20.times do  
 	StudentCourse.create!(
  	student: students.sample,
  	course: courses.sample,
 	 	note: Faker::Lorem.sentence(3, true, 4)
 	)
end

puts "Seed finished"
puts "#{Course.count} courses created"
puts "#{Student.count} students created"
puts "#{StudentCourse.count} student_courses created"
