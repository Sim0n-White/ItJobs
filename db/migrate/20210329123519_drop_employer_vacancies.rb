class DropEmployerVacancies < ActiveRecord::Migration[6.1]
  def change
    drop_table :employer_vacancies
  end
end
