class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string :product_name
      t.text :instructions
      t.integer :category_id
      t.integer :status_id
      t.integer :burden_id 
      t.integer :prefecture_id
      t.integer :days_id
      t.integer :price
      t.timestamps
    end
  end
end
