class CreateFeatureHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_houses do |t|
      t.references :house, foreign_key: true
      t.references :feature, foreign_key: true
      t.timestamps
    end
  end
end
