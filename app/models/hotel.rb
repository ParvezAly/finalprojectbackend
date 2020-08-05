# == Schema Information
#
# Table name: hotels
#
#  id                 :bigint           not null, primary key
#  name               :string
#  video_url          :string
#  adult_price        :float
#  child_price        :float
#  attraction_area_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Hotel < ApplicationRecord
  # hotel have one to many relations with Areas
  belongs_to :attraction_area
  has_many :booking_masters
  validates :name, :video_url, :adult_price, :presence => true
end
