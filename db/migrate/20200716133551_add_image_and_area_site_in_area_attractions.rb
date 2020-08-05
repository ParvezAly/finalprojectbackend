class AddImageAndAreaSiteInAreaAttractions < ActiveRecord::Migration[6.0]
  def change
    add_column :attraction_areas, :area_site, :string
    add_column :attraction_areas, :thumbnail_img_url, :string
  end
end
