class CreateEmployerVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :employer_vacancies do |t|
      t.string :position
      t.integer :schedule_id
      t.integer :country_id
      t.integer :city_id
      t.integer :fork_from
      t.integer :fork_to
      t.integer :currency_id
      t.integer :payment_period_id
      t.string :contact_email
      t.string :contact_person
      t.string :company_name
      t.string :company_site

      t.timestamps
    end
  end
end
