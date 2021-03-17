class SchoolsController < ApplicationController
  before_action :authenticate_nursing_teacher!, only: [:index] 

  def index
    @schools = School.all
    @nursing_teacher = NursingTeacher.find(current_nursing_teacher.id)
  end
end
