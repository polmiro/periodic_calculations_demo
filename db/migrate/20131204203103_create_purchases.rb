class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.timestamp :paid_at
      t.integer :price

      t.timestamps
    end
  end
end
