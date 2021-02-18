class AdministrationsController < ApplicationController
  before_action :load_model, only: %i[show]

  def index
    authorize :administration

    @pagy, @vacancies = pagy(EmployerVacancy.where(status: false))
  end

  def show
    authorize :administration

  end

  private

  def load_model
    @employer_vacancy = EmployerVacancy.find params[:id]
  end

end
