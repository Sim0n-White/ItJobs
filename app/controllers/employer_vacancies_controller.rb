class EmployerVacanciesController < ApplicationController
  before_action :load_model, only: %i[show edit update accept reject destroy]
  before_action :load_collections, only: %i[new create edit update]

  def index
    authorize EmployerVacancy

    @pagy, @vacancies = pagy(EmployerVacancy.where(user_id: current_user.id))
  end

  def new
    authorize EmployerVacancy

    @employer_vacancy = EmployerVacancy.new
  end

  def edit
    authorize @employer_vacancy
  end

  def update
    authorize @employer_vacancy

    if @employer_vacancy.update vacancy_params
      redirect_to employer_vacancies_path, notice: 'Ваканстя успешно изменена!'
    else
      render :edit
    end
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

  def destroy
    authorize EmployerVacancy

    @employer_vacancy.destroy
    redirect_to employer_vacancies_path
  end

  def show
    authorize @employer_vacancy
    @employer_vacancy.update(views_count: @employer_vacancy.views_count + 1)
  end

  def accept
    authorize @employer_vacancy
    @employer_vacancy.update(status: true)
    redirect_to administrations_path, notice: 'Вакансия принята!'
  end

  def reject
    authorize @employer_vacancy
    @employer_vacancy.update(status: false)
    redirect_to administrations_path, notice: 'Вакансия отклонена!'
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
      :schedule_id,
      :code_language_id,
      :remote_work
    )
  end

  def load_collections
    @schedules = Schedule.all
    @cities = City.all.order(:city_name)
    @countries = Country.all.order(:country_name)
    @currencies = Currency.all.order(:currency_name)
    @period = PaymentPeriod.all.order(:payment_period_name)
    @code_languages = CodeLanguage.all.order(:code_language_name)
  end

  def load_model
    @employer_vacancy = EmployerVacancy.find params[:id]
  end

end
