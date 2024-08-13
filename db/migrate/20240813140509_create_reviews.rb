class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :rating
      t.references :guest, foreign_key: { to_table: :users }
      t.references :reservation, foreign_key: true
      t.timestamps
    end
  end
end
