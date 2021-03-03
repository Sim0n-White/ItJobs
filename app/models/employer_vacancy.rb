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
#  remote_work       :boolean          default(FALSE)
#  status            :boolean          default(FALSE)
#  views_count       :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  city_id           :integer
#  code_language_id  :integer
#  country_id        :integer
#  currency_id       :integer
#  payment_period_id :integer
#  schedule_id       :integer
#  user_id           :integer
#

class EmployerVacancy < ActiveRecord::Base
  include Filterable
  has_rich_text :body

  validates :company_site, format: URI::regexp(%w[http https])

  belongs_to :user
  belongs_to :city
  belongs_to :country
  belongs_to :code_language
  belongs_to :currency
  belongs_to :payment_period
  belongs_to :schedule
end
