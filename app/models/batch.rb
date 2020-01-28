class Batch < ApplicationRecord
    belongs_to :account
    has_many :cashflows
end
