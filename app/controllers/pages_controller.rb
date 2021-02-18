class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[itjobs]

  def itjobs
    @pagy, @vacancies = pagy(EmployerVacancy.all)
  end
end
