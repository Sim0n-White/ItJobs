class AddUserIdToVacancies < ActiveRecord::Migration[6.1]
  def change
    add_column :employer_vacancies, :user_id, :integer
    add_column :employee_vacancies, :user_id, :integer
  end
end
