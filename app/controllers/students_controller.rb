class StudentsController < ApplicationController

  before_action :require_login, only: [:new, :create, :edit, :update, :destroy, :remove_photo]
  before_action :set_student, only: [:show, :edit, :update, :destroy, :remove_photo]

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

  def remove_photo
    @student.photo = nil
    @student.save
    redirect_to @student, flash: { success: 'Student profile photo has been removed.' }
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :age, :grade, :about, :photo)
    end
end
