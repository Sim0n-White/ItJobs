# == Schema Information
#
# Table name: employer_vacancies
#
#  id                :bigint           not null, primary key
#  company_name      :string
#  company_site      :string
#  contact_email     :string
#  contact_person    :string
#  fork_from         :integer
#  fork_to           :integer
#  position          :string
#  views_count       :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  city_id           :integer
#  country_id        :integer
#  currency_id       :integer
#  payment_period_id :integer
#  schedule_id       :integer
#  user_id           :integer
#

class EmployerVacancy < ActiveRecord::Base
  has_rich_text :body

  belongs_to :user
  belongs_to :schedule
end
