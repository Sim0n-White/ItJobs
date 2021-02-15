class PagesController < ApplicationController
  before_action :authenticate_user!
  def itjobs
    @pagy, @vacancies = pagy(EmployerVacancy.all)
  end
end
