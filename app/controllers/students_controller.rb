class StudentsController < ApplicationController
  # before_action :authenticate_nursing_teacher!, only: [:new,:edit,:destroy]
  # before_action :set_student, only: [:edit, :create, :destroy]
  # before_action :move_to_index, only: [:edit, :create]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(
      :last_name, :first_name, :date, :school_year, :school_class, :numder, :gender, 
      :brother, :allergy, :special_support, :other_ht, :other_nt, :nursing_teacher 
    ).merge(nursing_teacher_id: current_nursing_teacher.school_id)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if @student.nursing_teacher.school_id != current_nursing_teacher.school_id
  end

end
