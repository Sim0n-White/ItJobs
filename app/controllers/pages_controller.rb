class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[itjobs]

  def itjobs

    @vacancies_finder = Search::EmployerVacancyFinder.new(params, session).find
    @pagy, @vacancies = pagy(@vacancies_finder.where(status: true))
  end
end
