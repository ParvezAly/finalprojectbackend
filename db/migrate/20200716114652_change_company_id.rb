class ChangeCompanyId < ActiveRecord::Migration[6.0]
  def change
    rename_column :attraction_areas, :country_ID, :country_id
  end
end
