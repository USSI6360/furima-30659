class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order          ,foreign_key: true
      t.string :yubin              , null: false
      t.integer :prefecture_id     , null: false
      t.string :municipality       , null: false
      t.string :number             , null: false
      t.string :building           , null: false
      t.string :tell               , null: false
      t.timestamps
    end
  end
end
