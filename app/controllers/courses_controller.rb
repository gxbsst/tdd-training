class CoursesController < ApplicationController

  def new
   @course = Course.new
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(:id => params[:id]) rescue nil
    if !@course
      redirect_to courses_path
    end
  end

  def update
    set_course
    if @course.update_attributes(params[:course])
      redirect_to courses_path
    else
      render :edit
    end
  end

  def edit
    set_course
  end

  def destroy
    set_course
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course ||= Course.find(params[:id])
  end
end