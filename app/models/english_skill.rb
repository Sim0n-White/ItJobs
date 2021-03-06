# == Schema Information
#
# Table name: english_skills
#
#  id                 :bigint           not null, primary key
#  english_skill_name :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class EnglishSkill < ActiveRecord::Base
end
