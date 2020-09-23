class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer   :user_id,  null: false, foreign_key: true
      t.integer   :items_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
