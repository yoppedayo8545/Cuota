class SchoolsController < ApplicationController
  require 'date'
  
  before_action :authenticate_nursing_teacher!, only: [:index]
  before_action :year_update, only: [:index] 
  before_action :year_check, only: [:index] 
  before_action :id_set

  def index
    # .group_byを使ってグルーピングしたい…
    # @one_year = Student.group_by { |year| 
      # [year[:school_year_id]]
    #  }
  end

  def class_change_one_year
  end

  def class_change_second_year
  end

  def class_change_third_year
  end

  def class_change_fourth_year
  end

  def class_change_fifth_year
  end

  def class_change_six_year
  end

  def reset_one_year
    class_id = params[:school_class_id]
    student_ids = params[:student_ids]
    return redirect_to class_change_one_year_schools_path, notice: " 変更する生徒を選択してください " if student_ids.nil?
    return redirect_to class_change_one_year_schools_path, notice: " 変更先のクラスを選択してください " if class_id.blank?
    if student_ids.present?
      students_changing_id = Student.find(params[:student_ids])
      students_changing_id.each do |student|
       student.school_class_id = class_id
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 1, school_class_id: 1).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 1, school_class_id: 2).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 1, school_class_id: 3).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      redirect_to class_change_one_year_schools_path
    end
  end

  def reset_second_year
    class_id = params[:school_class_id]
    student_ids = params[:student_ids]
    return redirect_to class_change_second_year_schools_path, notice: " 変更する生徒を選択してください" if student_ids.nil?
    return redirect_to class_change_second_year_schools_path, notice: " 変更先のクラスを選択してください " if class_id.blank?
    if student_ids.present?
      students_changing_id = Student.find(params[:student_ids])
      students_changing_id.each do |student|
        student.school_class_id = class_id
        student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 2, school_class_id: 1).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}",school_year_id: 2, school_class_id: 2).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}",school_year_id: 2, school_class_id: 3).sort_students
      students.each_with_index do |student, num|
       student.number = "#{num}"
       student.save
      end
      redirect_to class_change_second_year_schools_path
    end
  end

  def reset_third_year
    class_id = params[:school_class_id]
    student_ids = params[:student_ids]
    return redirect_to class_change_third_year_schools_path, notice: " 変更する生徒を選択してください" if student_ids.nil?
    return redirect_to class_change_third_year_schools_path, notice: " 変更先のクラスを選択してください " if class_id.blank?
    if student_ids.present?
      students_changing_id = Student.find(params[:student_ids])
      students_changing_id.each do |student|
       student.school_class_id = class_id
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 3, school_class_id: 1).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 3, school_class_id: 2).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 3, school_class_id: 3).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      redirect_to class_change_third_year_schools_path
    end
  end

  def reset_fourth_year
    class_id = params[:school_class_id]
    student_ids = params[:student_ids]
    return redirect_to class_change_fourth_year_schools_path, notice: " 変更する生徒を選択してください" if student_ids.nil?
    return redirect_to class_change_fourth_year_schools_path, notice: " 変更先のクラスを選択してください " if class_id.blank?
    if student_ids.present?
      student = Student.find(params[:student_ids])
      student.each do |student|
       student.school_class_id = class_id
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 4, school_class_id: 1).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 4, school_class_id: 2).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 4, school_class_id: 3).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      redirect_to class_change_fourth_year_schools_path
    end
  end

  def reset_fifth_year
    class_id = params[:school_class_id]
    student_ids = params[:student_ids]
    return redirect_to class_change_fifth_year_schools_path, notice: " 変更する生徒を選択してください" if student_ids.nil?
    return redirect_to class_change_fifth_year_schools_path, notice: " 変更先のクラスを選択してください " if class_id.blank?
    if student_ids.present?
      students_changing_id = Student.find(params[:student_ids])
      students_changing_id.each do |student|
       student.school_class_id = class_id
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 5, school_class_id: 1).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 5, school_class_id: 2).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 5, school_class_id: 3).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      redirect_to class_change_fifth_year_schools_path
    end
  end

  def reset_six_year
    class_id = params[:school_class_id]
    student_ids = params[:student_ids]
    return redirect_to class_change_six_year_schools_path, notice: " 変更する生徒を選択してください" if student_ids.nil?
    return redirect_to class_change_six_year_schools_path, notice: " 変更先のクラスを選択してください " if class_id.blank?
    if student_ids.present?
      students_changing_id = Student.find(params[:student_ids])
      students_changing_id.each do |student|
       student.school_class_id = class_id
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 6, school_class_id: 1).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 6, school_class_id: 2).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      students = Student.where(school_id: "#{@nursing_teacher.school_id}", school_year_id: 6, school_class_id: 3).sort_students
      students.each.with_index(1) do |student, num|
       student.number = "#{num}"
       student.save
      end
      redirect_to class_change_six_year_schools_path
    end
  end

  private

  def year_update
    @students = Student.all
    now = Date.today 
    if now.month == 4
      @students.each do |student|
        if student.school_year_update == 0 
           student.increment( :school_year_id, 1) 
           student.increment( :school_year_update, 1)
           student.save
        end
      end
    end
  end

  def year_check
    students = Student.all
    now = Date.today
      students.each do |student|
        if now.month != 4 && student.school_year_update == 1
        student.decrement!( :school_year_update, 1 )
        end
      end
  end

  def id_set
    @nursing_teacher = NursingTeacher.find(current_nursing_teacher.id)
    @students = Student.all.sort_students
  end

  def student_params
    params.permit(
      :last_name, :first_name, :last_kana, :first_kana, :date, :school_year_id, :school_class_id, :number, :gender_id,
      :brother, :allergy, :medicine, :anaphylaxis, :allergy_other,
      :special_support, :other_ht, :other_nt, :school_id, :nursing_teacher
    ).merge(nursing_teacher_id: current_nursing_teacher.id)
  end

end