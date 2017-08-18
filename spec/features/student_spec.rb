require 'rails_helper'

RSpec.describe "Student", :type => feature do
  let!(:test_student) { create(:student) }

  feature 'View all students' do        
    scenario 'allows viewing the list of all students' do
      visit "/students"
      expect(page).to have_content 'Add a New Student'
      expect(page).to have_content test_student.name
    end
  end

  feature 'Create a student' do        
    scenario 'allows creating a student' do
      visit "/students"
      click_on "Add a New Student"
      fill_in 'student_name', :with => "New Student Name"
      click_on "Create Student"
      expect(page).to have_content 'Total count: 2'
      expect(page).to have_content "New Student Name"
    end
  end
  
  feature 'Edit a student' do        
    scenario 'allows editing a student' do
      visit "/students"
      expect(page).to have_content 'Total count: 1'
      click_on "Edit"
      expect(page).to have_content "Edit Student"
      fill_in 'student_name', :with => "John Doe"
      click_on "Update Student"
      expect(page).to have_content "John Doe"
    end
  end
  
  feature 'Delete a student' do        
    scenario 'allows deleting a student' do
      visit "/students"
      expect(page).to have_content 'Total count: 1'
      click_on "Delete"
      expect(page).to have_no_content test_student.name
      expect(page).to have_content 'Total count: 0'
    end
  end
end

