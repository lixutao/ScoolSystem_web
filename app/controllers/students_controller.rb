class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to students_path
  end

  def update
    @student.update(student_params)
    redirect_to students_path
  end

  def destroy
    @student.destroy
    redirect_to :back
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :sex, :age)
    end
end
