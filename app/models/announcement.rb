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
class Announcement < ActiveRecord::Base

end
