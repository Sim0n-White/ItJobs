class AddCodeLanguageIdToEmployerVacancies < ActiveRecord::Migration[6.1]
  def change
    add_column :employer_vacancies, :code_language_id, :integer
  end
end
