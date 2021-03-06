class CreateEmployeeSummaries < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_summaries do |t|
      t.string :position
      t.integer :schedule_id
      t.integer :country_id
      t.integer :city_id
      t.integer :fork_from
      t.integer :fork_to
      t.integer :currency_id
      t.integer :payment_period_id
      t.string :contact_email
      t.string :contact_phone
      t.integer :user_id
      t.integer :views_count, default: 0
      t.boolean :status, default: false
      t.integer :code_language_id
      t.string :first_name
      t.string :second_name
      t.integer :skill_level_id
      t.boolean :english_skill_id, default: false
      t.boolean :remote_work, default: false
      t.boolean :git_check, default: false

      t.timestamps
    end
  end
end
