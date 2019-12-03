class AddForeignKeyCityToUser < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :city, index: true
  end
end
