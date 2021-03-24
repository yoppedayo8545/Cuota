class StudentsController < ApplicationController
  # before_action :authenticate_nursing_teacher!, only: [:new,:edit,:destroy]
  before_action :set_student, only: [ :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

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

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  def search
    @nursing_teacher = NursingTeacher.find(current_nursing_teacher.id)
    @students = Student.search(params[:keyword])
  end

  private

  def student_params
    params.require(:student).permit(
      :last_name, :first_name, :last_kana, :first_kana, :date, :school_year_id, :school_class_id, :number, :gender_id, 
      :brother, :allergy, :medicine, :anaphylaxis, :allergy_other, 
      :special_support, :other_ht, :other_nt, :school_id, :nursing_teacher 
    ).merge(nursing_teacher_id: current_nursing_teacher.id)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if @student.school_id != current_nursing_teacher.school_id 
  end

end