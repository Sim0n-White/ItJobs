# == Schema Information
#
# Table name: currencies
#
#  id            :bigint           not null, primary key
#  currency_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Currency < ActiveRecord::Base
end
