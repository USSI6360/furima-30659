class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order
      t.string :yubin
      t.integer :prefecture_id
      t.string :municipality
      t.string :number
      t.string :building
      t.string :tell
      t.timestamps
    end
  end
end
