class CreateNeighborhoods < ActiveRecord::Migration[7.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name, null:false
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
