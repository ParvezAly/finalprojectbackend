# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Country < ApplicationRecord
  has_many    :attraction_areas
  validates :title, presence: true
end
