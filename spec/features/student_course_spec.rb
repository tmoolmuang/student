require 'rails_helper'

RSpec.describe "StudentCourse", :type => feature do
  let!(:test_student) { create(:student) }
  let!(:test_course) { create(:course) }
  let!(:test_student_course) { create(:student_course, student: test_student, course: test_course) }

  feature 'View all student courses' do        
    scenario 'allows viewing the list of all student courses' do
      visit "/home/index"
      expect(page).to have_content 'All Records'
      expect(page).to have_content test_student_course.note
    end
  end

  feature 'Delete a student course' do        
    scenario 'allows deleting a student course from records menu' do
      visit "/home/index"
      click_on "Delete"
      expect(page).to have_content 'Show Student'
      expect(page).to have_no_content test_student_course.note
    end
  end

  feature 'Delete a student course' do        
    scenario 'allows deleting a student course from student show menu' do
      visit "/students"
      click_on "Show"
      expect(page).to have_content 'Add a New Course'
      click_on "Delete"
      expect(page).to have_content 'Show Student'
      expect(page).to have_no_content test_student_course.note
    end
  end

  feature 'Create a student course' do        
    scenario 'allows creating a student course' do
      visit "/students"
      click_on "Show"
      click_on "Add a New Course"
      all('#student_course_course_id option')[1].select_option
      fill_in 'student_course_note', :with => "New Note"
      click_on "Add Course"
      expect(page).to have_content 'Course count: 2'
      expect(page).to have_content "New Note"
    end
  end  
end

