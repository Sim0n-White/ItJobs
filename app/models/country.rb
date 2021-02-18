# == Schema Information
#
# Table name: countries
#
#  id           :bigint           not null, primary key
#  country_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Country < ActiveRecord::Base
  has_many :cities
end
