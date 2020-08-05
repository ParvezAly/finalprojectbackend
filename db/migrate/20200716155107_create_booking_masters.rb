class CreateBookingMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_masters do |t|
      t.integer :booking_type
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :num_of_adults
      t.integer :num_of_children
      t.text :addtional_instructions
      t.integer :hotel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
