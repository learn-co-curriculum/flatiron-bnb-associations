class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :address
      t.string :listing_type
      t.string :title
      t.string :description
      t.integer :price
      t.references :neighborhood, foreign_key: true
      t.references :host, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
