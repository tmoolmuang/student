require 'rails_helper'

RSpec.describe StudentCourse, type: :model do
	let(:test_student) { create(:student) }
	let(:test_course) { create(:course) }
  let(:test_student_course) { create(:student_course, student: test_student, course: test_course) }
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:course) }
  
  describe "attributes" do
    it "has student, course, and note" do
      expect(test_student_course).to have_attributes(student: test_student, course: test_course, note: test_student_course.note)
    end
  end
end
