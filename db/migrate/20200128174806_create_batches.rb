class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.integer :account_id
      t.datetime :date
      t.integer :income
      t.integer :expenses
      t.integer :balance

      t.timestamps
    end
  end
end
