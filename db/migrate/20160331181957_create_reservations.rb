class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :checkin,  null: false
      t.datetime :checkout, null: false

      t.integer :guest_id,   null: false
      t.integer :listing_id, null: false

      t.timestamps null: false
    end
  end
end
