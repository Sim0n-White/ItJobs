class EmployerVacanciesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_model, only: %i[show]
  before_action :load_collections, only: %i[new create]

  def index
    @vacancies = EmployerVacancy.all
  end

  def new
    authorize EmployerVacancy

    @employer_vacancy = EmployerVacancy.new
  end

  def edit

  end

  def update

  end
  def create
    authorize EmployerVacancy

    @employer_vacancy = EmployerVacancy.new(vacancy_params)
    @employer_vacancy.user_id = current_user.id
    if @employer_vacancy.save
      redirect_to root_path, notice: 'Ваканстя успешно создана!'
    else
      render :new
    end
  end

  def show
    @employer_vacancy.update(views_count: @employer_vacancy.views_count + 1)
  end

  private

  def vacancy_params
    params.require(:employer_vacancy).permit(
      :company_name,
      :company_site,
      :contact_email,
      :contact_person,
      :fork_from,
      :fork_to,
      :position,
      :body,
      :city_id,
      :country_id,
      :currency_id,
      :payment_period_id,
      :schedule_id
    )
  end

  def load_collections
    @schedules = Schedule.all
    @cities = City.all.order(:city_name)
    @countries = Country.all.order(:country_name)
    @currencies = Currency.all.order(:currency_name)
    @period = PaymentPeriod.all.order(:payment_period_name)
  end


  def load_model
    @employer_vacancy = EmployerVacancy.find params[:id]
  end

end
