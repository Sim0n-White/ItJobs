class AddVacancyStatusToEmployerVacancies < ActiveRecord::Migration[6.1]
  def change
    add_column :employer_vacancies, :status, :boolean, default: false
  end
end
