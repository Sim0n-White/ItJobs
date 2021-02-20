# == Schema Information
#
# Table name: code_languages
#
#  id                 :bigint           not null, primary key
#  code_language_name :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class CodeLanguage < ActiveRecord::Base

end
