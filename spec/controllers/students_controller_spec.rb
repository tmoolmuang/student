require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  let(:test_student) { create(:student) }
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns test_student to all Students" do
      get :index
      expect(assigns(:students)).to eq([test_student])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: test_student.id }
      expect(response).to have_http_status(:success)
    end

    it "renders #show view" do
      get :show, params: { id: test_student.id }
      expect(response).to render_template :show
    end

    it "assigns test_student to @student" do
      get :show, params: { id: test_student.id }
      expect(assigns(:student)).to eq(test_student)
    end    
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "returns http redirect to #index view" do
      post :create, student: { name: test_student.name }
      expect(response).to redirect_to(:action => "index")
    end
    
    it "increases the number of student by 1" do
      expect{ post :create, student: { name: "name" } }.to change(Student, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: test_student.id } 
      expect(response).to have_http_status(:success)
    end

    it "renders #edit view" do
      get :edit, params: { id: test_student.id }
      expect(response).to render_template :edit
    end
  end

  describe "PUT update" do
    it "returns http redirect to #show view" do
      put :update, id: test_student.id, student: { name: "New Name" }
      expect(response).to redirect_to(:action => "show", :id => test_student.id)
    end
  end

  describe "DELETE destroy" do
    it "returns http redirect to #index view" do
      delete :destroy, params: { id: test_student.id }
      expect(response).to redirect_to(:action => "index")
    end
    
    it "decreases the number of student by 1" do
      student_id = test_student.id
      delete :destroy, params: { id: student_id }
      count = Student.where({ id:student_id }).size
      expect(count).to eq 0
    end
  end  
end
