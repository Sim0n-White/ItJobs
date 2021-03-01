# == Schema Information
#
# Table name: employee_summaries
#
#  id                :bigint           not null, primary key
#  contact_email     :string
#  contact_phone     :string
#  first_name        :string
#  fork_from         :integer
#  fork_to           :integer
#  git_check         :boolean          default(FALSE)
#  position          :string
#  remote_work       :boolean          default(FALSE)
#  second_name       :string
#  status            :boolean          default(FALSE)
#  views_count       :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  city_id           :integer
#  code_language_id  :integer
#  country_id        :integer
#  currency_id       :integer
#  english_skill_id  :boolean          default(FALSE)
#  payment_period_id :integer
#  schedule_id       :integer
#  skill_level_id    :integer
#  user_id           :integer
#
class EmployeeSummary < ActiveRecord::Base
  include Filterable
  has_rich_text :body

  belongs_to :user
  belongs_to :city
  belongs_to :country
  belongs_to :code_language
  belongs_to :currency
  belongs_to :payment_period
  belongs_to :schedule
end
