class StudentsController < ApplicationController

  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, flash: { success: 'New student profile created.' }
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student, flash: { success: 'Student profile has been updated.' }
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, flash: { success: 'Student profile has been deleted.' }
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :age, :grade, :about)
    end
end
