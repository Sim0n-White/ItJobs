class AddViewsCountToVacancies < ActiveRecord::Migration[6.1]
  def change
    add_column :employer_vacancies, :views_count, :integer, default: 0
  end
end
