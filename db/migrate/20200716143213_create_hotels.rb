class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :video_url
      t.float :adult_price
      t.float :child_price
      t.integer :attraction_area_id

      t.timestamps
    end
  end
end
