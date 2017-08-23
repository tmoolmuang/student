module Api
  module V1
    class StudentCoursesController < ApplicationController
      protect_from_forgery with: :null_session
      before_filter :verify_token

      def index
        student_courses = StudentCourse.all
        render json: { status: 'SUCCESS', message: "All Students and Courses loaded", data: student_courses }, status: :ok
      end

      def create
        student_course = Student.find(params[:student_id]).student_courses.build(student_course_params)
        if student_course.save
          render json: { status: 'SUCCESS', message: 'Student Course created', data: student_course }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Student Course not created', data: student_course.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        student_course = StudentCourse.find(params[:id]).destroy
        render json: { status: 'SUCCESS', message: 'Student Course deleted', data: student_course },status: :ok
      end

      private
      def student_course_params
        params.require(:student_course).permit(:course_id, :note)
      end
      
      def verify_token
        authenticate_or_request_with_http_token do |token, options|
          User.find_by_api_token(token).present?
        end
      end      
    end
  end
end
