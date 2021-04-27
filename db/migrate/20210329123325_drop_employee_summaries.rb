class DropEmployeeSummaries < ActiveRecord::Migration[6.1]
  def change
    drop_table :employee_summaries
  end
end
