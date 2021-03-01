# == Schema Information
#
# Table name: skill_levels
#
#  id               :bigint           not null, primary key
#  skill_level_name :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class SkillLevel < ActiveRecord::Base
end
