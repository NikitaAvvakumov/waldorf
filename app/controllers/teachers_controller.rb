class TeachersController < ApplicationController

  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def show
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, flash: { success: 'New teacher created.' }
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, flash: { success: 'Teacher profile has been updated.' }
    else
      render 'edit'
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_path, flash: { success: 'Teacher profile has been deleted.' }
  end

  private

    def teacher_params
      params.require(:teacher).permit(:name, :subjects, :email, :bio)
    end

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
end
