class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :title
      t.text :description
      t.integer :room_number
      t.string :address
      t.string :status
      t.references :district, foreign_key: true
      t.references :user, foreign_key: true
      t.references :type, foreign_key: true
      t.timestamps
    end
  end
end
