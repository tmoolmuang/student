require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:test_course) { create(:course) }
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns test_course to all Courses" do
      get :index
      expect(assigns(:courses)).to eq([test_course])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: test_course.id }
      expect(response).to have_http_status(:success)
    end

    it "renders #show view" do
      get :show, params: { id: test_course.id }
      expect(response).to render_template :show
    end

    it "assigns test_course to @course" do
      get :show, params: { id: test_course.id }
      expect(assigns(:course)).to eq(test_course)
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
      post :create, course: { name: test_course.name }
      expect(response).to redirect_to(:action => "index")
    end
    
    it "increases the number of course by 1" do
      expect{ post :create, course: { name: "name" } }.to change(Course, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: test_course.id } 
      expect(response).to have_http_status(:success)
    end

    it "renders #edit view" do
      get :edit, params: { id: test_course.id }
      expect(response).to render_template :edit
    end
  end

  describe "PUT update" do
    it "returns http redirect to #show view" do
      put :update, id: test_course.id, course: { name: "New Name" }
      expect(response).to redirect_to(:action => "show", :id => test_course.id)
    end
  end

  describe "DELETE destroy" do
    it "returns http redirect to #index view" do
      delete :destroy, params: { id: test_course.id }
      expect(response).to redirect_to(:action => "index")
    end
    
    it "decreases the number of course by 1" do
      course_id = test_course.id
      delete :destroy, params: { id: course_id }
      count = Course.where({ id:course_id }).size
      expect(count).to eq 0
    end
  end  
end
