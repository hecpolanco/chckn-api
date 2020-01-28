class CreateCashflows < ActiveRecord::Migration[6.0]
  def change
    create_table :cashflows do |t|
      t.integer :account_id
      t.integer :batch_id
      t.datetime :date
      t.string :type
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
