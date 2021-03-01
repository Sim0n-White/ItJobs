class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[itjobs]
  before_action :load_collections, only: %i[itjobs]

  def itjobs
    if current_user.employer?
      @employee_summaries_finder = Search::EmployerVacancyFinder.new(params, session).find
      @pagy, @vacancies = pagy(xcvgfvxcemployer_vacancies_finder.collection.where(status: true))
    else
      @employer_vacancies_finder = Search::EmployerVacancyFinder.new(params, session).find
      @pagy, @vacancies = pagy(@employer_vacancies_finder.collection.where(status: true))
    end
  end

  private

  def load_collections
    @schedules = Schedule.all
    @cities = City.all.order(:city_name)
    @countries = Country.all.order(:country_name)
    @currencies = Currency.all.order(:currency_name)
    @period = PaymentPeriod.all.order(:payment_period_name)
    @code_languages = CodeLanguage.all.order(:code_language_name)
  end
end
