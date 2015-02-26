class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number_room
      t.string :type_room
      t.integer :size_room

      t.timestamps
    end
  end
end
