class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :schedule_name

      t.timestamps
    end
  end
end
