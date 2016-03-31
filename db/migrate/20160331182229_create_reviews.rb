class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :guest_id,       null: false
      t.integer :rating,         null: false
      t.integer :reservation_id, null: false

      t.string :description

      t.timestamps null: false
    end
  end
end
