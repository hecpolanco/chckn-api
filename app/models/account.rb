class Account < ApplicationRecord
    belongs_to :user
    has_many :cashflows
    has_many :batches
end
