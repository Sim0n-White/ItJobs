# == Schema Information
#
# Table name: schedules
#
#  id            :bigint           not null, primary key
#  schedule_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Schedule < ActiveRecord::Base

end
