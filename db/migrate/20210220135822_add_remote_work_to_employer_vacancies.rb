class AddRemoteWorkToEmployerVacancies < ActiveRecord::Migration[6.1]
  def change
    add_column :employer_vacancies, :remote_work, :boolean, default:  false
  end
end
