class Cashflow < ApplicationRecord
    belongs_to :account
    belongs_to :batch
end
