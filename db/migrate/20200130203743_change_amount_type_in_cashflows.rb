class ChangeAmountTypeInCashflows < ActiveRecord::Migration[6.0]
  def change
    change_column :cashflows, :amount, :decimal
  end
end
