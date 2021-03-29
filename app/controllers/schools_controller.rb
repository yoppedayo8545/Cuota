class SchoolsController < ApplicationController
  before_action :authenticate_nursing_teacher!, only: [:index]
  # before_action :year_update, only: [:index] 
  before_action :year_check, only: [:index] 

  def index
    @nursing_teacher = NursingTeacher.find(current_nursing_teacher.id)
    @students = Student.all.order(:number)
  end

  def class_change
    @nursing_teacher = NursingTeacher.find(current_nursing_teacher.id)
    @students = Student.all.order(:number)
  end

  private

  def year_update
    @students = Student.all
    require 'date'
    now = Date.today 
    if now.month == 4
      @students.each do |student|
      if student.school_year_update == 0
        begin
        ActiveRecord::Base.transaction{
            Student.where.not(school_year_id: 7).update_all("school_year_id = school_year_id + 1") 
            Student.update_all("school_year_update = school_year_update + 1")
        }
        end
      end
      end
    end
  end

  def year_check
    @students = Student.all
    require 'date'
    now = Date.today
      @students.each do |student|
        if now.month != 4 && student.school_year_update == 1
        student.where.not(school_year_update: 0).update_all("school_year_update = school_year_update - 1")
        end
      end
  end

end