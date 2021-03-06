class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :number
      t.date :date_start
      t.date :date_end
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
