# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  city_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer
#
class City < ActiveRecord::Base
  belongs_to :country
end
