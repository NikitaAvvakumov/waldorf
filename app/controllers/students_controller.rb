class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @students = Student.all
    @student = Student.find(params[:id])
  end
end
