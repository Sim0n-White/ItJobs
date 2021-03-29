# == Schema Information
#
# Table name: announcements
#
#  id                :bigint           not null, primary key
#  company_name      :string
#  company_site      :string
#  contact_email     :string
#  contact_person    :string
#  contact_phone     :string
#  document_type     :string
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
class EmployeeSummary < Announcement
  include Filterable
  has_rich_text :body

  validates :first_name, :second_name, :position, :city_id, :code_language_id, :english_skill_id, :country_id,
            :contact_email, :contact_phone, :fork_from, :fork_to, :currency_id, :schedule_id, :skill_level_id, presence: { message: "Не может быть пустым" }


  belongs_to :user
  belongs_to :city
  belongs_to :country
  belongs_to :code_language
  belongs_to :currency
  belongs_to :payment_period
  belongs_to :schedule
end
