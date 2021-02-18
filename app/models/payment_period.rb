# == Schema Information
#
# Table name: payment_periods
#
#  id                  :bigint           not null, primary key
#  payment_period_name :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class PaymentPeriod < ActiveRecord::Base
end
