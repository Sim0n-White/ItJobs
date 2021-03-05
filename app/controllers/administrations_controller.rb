class AdministrationsController < ApplicationController

  def unaccepted_vacancies
    authorize :administration

    @pagy, @vacancies = pagy(EmployerVacancy.where(status: false))
  end

  def unaccepted_summaries
    authorize :administration

    @pagy, @summaries = pagy(EmployeeSummary.where(status: false))
  end

  def show_vacancy
    authorize :administration

    @employer_vacancy = EmployerVacancy.find params[:id]
  end

  def show_summary
    authorize :administration

    @employee_summary = EmployeeSummary.find params[:id]
  end

end
