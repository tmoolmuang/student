require 'rails_helper'

RSpec.describe StudentCoursesController, type: :controller do
  let!(:test_student) { create(:student) }
  let!(:test_course) { create(:course) }
  let(:test_student_course) { create(:student_course, student: test_student, course: test_course) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  # note: make sure you pass everything that controller needs
  describe "GET #new" do
    it "returns http success" do
      get :new, params: { student_id: test_student.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "returns http redirect to #index view" do
      post :create, student_id: test_student.id, student_course: { course_id: test_course.id, note: "some notes" }
      expect(response).to redirect_to student_path(test_student.id)
    end
    
    it "increases the number of course by 1" do
      expect{ post :create, student_id: test_student.id, student_course: { course_id: test_course.id, note: "some notes" } }.to change(StudentCourse, :count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "returns http redirect to index view" do
      delete :destroy, params: { id: test_student_course.id, student_id: test_student.id }
      expect(response).to redirect_to student_path(test_student.id)
    end
    
    it "decreases the number of student course by 1" do
      student_course_id = test_student_course.id
      delete :destroy, params: { id: test_student_course.id, student_id: test_student.id }
      count = StudentCourse.where({ id: student_course_id }).size
      expect(count).to eq 0
    end
  end
end
