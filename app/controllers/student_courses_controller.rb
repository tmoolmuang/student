class StudentCoursesController < ApplicationController
  def show
  end

  def new
    @student_course = Student.find(params[:student_id]).student_courses.new
    @courses = Course.all
  end
  
  def create
    @student_course = Student.find(params[:student_id]).student_courses.build(student_course_params)
    if @student_course.save
      redirect_to student_path(@student_course.student)
    else
      render "new"
    end
  end

  def edit
  end

 	private
  def student_course_params
    params.require(:student_course).permit(:course_id, :note)
  end
end
