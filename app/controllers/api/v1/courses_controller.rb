module Api
  module V1
    class CoursesController < ApplicationController
      protect_from_forgery with: :null_session
      before_filter :verify_token
      
      def index
        courses = Course.all
        render json: { status: 'SUCCESS', message: 'Courses loaded', data: courses }, status: :ok
      end

      def show
        course = Course.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Course loaded', data: course }, status: :ok
      end

      def create
        course = Course.new(course_params)
        if course.save
          render json: { status: 'SUCCESS', message: 'Course created', data: course }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Course not created', data: course.errors }, status: :unprocessable_entity
        end
      end

      def update
        course = Course.find(params[:id])
        if course.update_attributes(course_params)
          render json: { status: 'SUCCESS', message: 'Course updated', data: course }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Course not updated', data: course.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        course = Course.find(params[:id])
        course.destroy
        render json: { status: 'SUCCESS', message: 'Course deleted', data: course },status: :ok
      end

      private
      def course_params
        params.require(:course).permit(:name, :description)
      end
      
      def verify_token
        authenticate_or_request_with_http_token do |token, options|
          User.find_by_api_token(token).present?
        end
      end
    end
  end
end
