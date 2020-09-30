class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :post_codo,        null: false
      t.string  :city,             null: false
      t.string  :addresses,        null: false
      t.string  :building,         null: false
      t.string  :phone,            null: false
      t.integer :order_id,     null: false, foreign_key:true 
      t.timestamps
    end
  end
end
