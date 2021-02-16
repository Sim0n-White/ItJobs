# == Schema Information
#
# Table name: employee_vacancies
#
#  id                :bigint           not null, primary key
#  company_name      :string
#  company_site      :string
#  contact_email     :string
#  contact_person    :string
#  education         :string
#  fork_from         :integer
#  fork_to           :integer
#  hobbies           :string
#  position          :string
#  views_count       :integer          default(0)
#  work_experience   :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  city_id           :integer
#  country_id        :integer
#  currency_id       :integer
#  payment_period_id :integer
#  schedule_id       :integer
#  user_id           :integer
#
class EmployeeVacancy < ActiveRecord::Base
  has_rich_text :body

  belongs_to :user
end
