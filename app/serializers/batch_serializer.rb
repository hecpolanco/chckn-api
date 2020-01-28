class BatchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :account_id, :date, :income, :expenses, :balance, :cashflows
end
