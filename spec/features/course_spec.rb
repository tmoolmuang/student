require 'rails_helper'

RSpec.describe "Course", :type => feature do
  let!(:test_course) { create(:course) }

  feature 'View all courses' do        
    scenario 'allows viewing the list of all courses' do
      visit "/courses"
      expect(page).to have_content 'Add a New Course'
      expect(page).to have_content test_course.name
    end
  end

  feature 'Create a course' do        
    scenario 'allows creating a course' do
      visit "/courses"
      click_on "Add a New Course"
      fill_in 'course_name', :with => "New Course Name"
      click_on "Create Course"
      expect(page).to have_content 'Total count: 2'
      expect(page).to have_content "New Course Name"
    end
  end
  
  feature 'Edit a course' do        
    scenario 'allows editing a course' do
      visit "/courses"
      expect(page).to have_content 'Total count: 1'
      click_on "Edit"
      expect(page).to have_content "Edit Course"
      fill_in 'course_name', :with => "NEWCOURSE"
      click_on "Update Course"
      expect(page).to have_content "NEWCOURSE"
    end
  end
  
  feature 'Delete a course' do        
    scenario 'allows deleting a course' do
      visit "/courses"
      expect(page).to have_content 'Total count: 1'
      click_on "Delete"
      expect(page).to have_no_content test_course.name
      expect(page).to have_content 'Total count: 0'
    end
  end
end

