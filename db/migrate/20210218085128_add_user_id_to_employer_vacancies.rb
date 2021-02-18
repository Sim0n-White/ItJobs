class AddUserIdToEmployerVacancies < ActiveRecord::Migration[6.1]
  def change
    add_column :employer_vacancies, :user_id, :integer
  end
end
