class CreateConversions < ActiveRecord::Migration[6.1]
  def change
    create_table :conversions do |t|
      t.integer :from_currency
      t.integer :to_currency
      t.float :amount
      t.float :exchange_rate

      t.timestamps
    end
  end
end
