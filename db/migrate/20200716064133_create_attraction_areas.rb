class CreateAttractionAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :attraction_areas do |t|
      t.string :title
      t.integer :country_ID
      
      t.timestamps
    end
  end
    
end
