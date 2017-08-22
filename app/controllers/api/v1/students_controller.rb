module Api
  module V1
    class StudentsController < ApplicationController
      protect_from_forgery with: :null_session
      before_filter :verify_token
      
      def index
        students = Student.all
        render json: { status: 'SUCCESS', message: 'Students loaded', data: students }, status: :ok
      end

      def show
        student = Student.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Student loaded', data: student }, status: :ok
      end

      def create
        student = Student.new(student_params)
        if student.save
          render json: { status: 'SUCCESS', message: 'Student created', data: student }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Student not created', data: student.errors }, status: :unprocessable_entity
        end
      end

      def update
        student = Student.find(params[:id])
        if student.update_attributes(student_params)
          render json: { status: 'SUCCESS', message: 'Student updated', data: student }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Student not updated', data: student.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: { status: 'SUCCESS', message: 'Student deleted', data: student },status: :ok
      end

      private
      def student_params
        params.require(:student).permit(:name)
      end
      
      def verify_token
        authenticate_or_request_with_http_token do |token, options|
          User.find_by_api_token(token).present?
        end
      end
    end
  end
end
