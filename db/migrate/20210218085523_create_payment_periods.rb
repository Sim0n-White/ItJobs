class CreatePaymentPeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_periods do |t|
      t.string :payment_period_name

      t.timestamps
    end
  end
end
