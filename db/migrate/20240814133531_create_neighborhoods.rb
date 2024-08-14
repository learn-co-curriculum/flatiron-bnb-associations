class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name

      t.references :city, foreign_key: true
    end
  end
end
