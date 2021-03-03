class EmployeeSummariesController < ApplicationController
  before_action :load_model, only: %i[show edit update accept reject destroy]
  before_action :load_collections, only: %i[new create edit update]

  def index
    authorize EmployeeSummary

    @pagy, @summaries = pagy(EmployeeSummary.where(user_id: current_user.id))
  end

  def new
    authorize EmployeeSummary
    @employee_summary = EmployeeSummary.new
  end

  def create
    authorize EmployeeSummary

    @employee_summary = EmployeeSummary.new(vacancy_params)
    @employee_summary.user_id = current_user.id
    if @employee_summary.save
      redirect_to root_path, notice: 'Ваканстя успешно создана!'
    else
      render :new
    end
  end

  def edit
    authorize @employee_summary
  end

  def update
    authorize @employee_summary

    if @employee_summary.update vacancy_params
      redirect_to employer_vacancies_path, notice: 'Ваканстя успешно изменена!'
    else
      render :edit
    end
  end

  def destroy
    authorize EmployerVacancy

    @employee_summary.destroy
    redirect_to employer_vacancies_path
  end

  def show
    @employee_summary.update(views_count: @employee_summary.views_count + 1)
  end

  def accept
    authorize @employee_summary
    @employee_summary.update(status: true)
    redirect_to administrations_path, notice: 'Вакансия принята!'
  end

  def reject
    authorize @employee_summary
    @employee_summary.update(status: false)
    redirect_to administrations_path, notice: 'Вакансия отклонена!'
  end

  private

  def vacancy_params
    params.require(:employee_summary).permit(
      :position,
      :schedule_id,
      :country_id,
      :city_id,
      :fork_from,
      :fork_to,
      :currency_id,
      :payment_period_id,
      :contact_email,
      :contact_phone,
      :code_language_id,
      :first_name,
      :second_name,
      :skill_level_id,
      :english_skill_id,
      :remote_work,
      :git_check,
      :body
    )
  end

  def load_collections
    @schedules = Schedule.all
    @cities = City.all.order(:city_name)
    @countries = Country.all.order(:country_name)
    @currencies = Currency.all.order(:currency_name)
    @period = PaymentPeriod.all.order(:payment_period_name)
    @code_languages = CodeLanguage.all.order(:code_language_name)
    @skill_levels = SkillLevel.all.order(:id)
    @english_skills = EnglishSkill.all.order(:english_skill_name)
  end

  def load_model
    @employee_summary = EmployeeSummary.find params[:id]
  end
end
