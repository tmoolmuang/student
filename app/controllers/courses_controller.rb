class CoursesController < ApplicationController
  def index
  	@courses = Course.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
