# == Schema Information
#
# Table name: attraction_areas
#
#  id                :bigint           not null, primary key
#  title             :string
#  country_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  area_site         :string
#  thumbnail_img_url :string
#
class AttractionArea < ApplicationRecord
    #Area have one to many relation with Country
    belongs_to :country
    #Area have on to many relation with Hotels
    has_many :hotels
    validates :title, :area_site, :thumbnail_img_url, :presence => true
end
