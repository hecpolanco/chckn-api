class AccountSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :balance, :cashflows
end
