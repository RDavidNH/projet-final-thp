class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.text :description
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
