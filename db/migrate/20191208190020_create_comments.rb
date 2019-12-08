class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.bigint :commentable_id
      t.string :commentable_type
      t.text :content
      t.int :rating

      t.timestamps
    end

    add_index :comments, [:commentable_type, :commentable_id]

  end
end
