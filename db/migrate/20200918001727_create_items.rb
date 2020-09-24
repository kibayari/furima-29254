class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,             null: false
      t.integer :price,            null: false
      t.text    :item_info,        null: false
      t.integer :genre_id,         null: false
      t.integer :comdition_id,     null: false
      t.integer :delivery_id,      null: false
      t.integer :shipping_id,      null: false
      t.integer :deliberyday_id,   null: false
      t.integer :user_id, null: false, foreign_key:true 
      t.timestamps
    end
  end
end
