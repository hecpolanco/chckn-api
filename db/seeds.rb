# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
hector = User.create(id: 1, username: "hector", password: "hector", name: "Hector")

Account.destroy_all
hecaccount = Account.create(id: 1, user_id: hector.id, balance: 1000)

Batch.destroy_all
janbatch = Batch.create(id: 1, account_id: hecaccount.id, date: "2020-01-01")

Cashflow.destroy_all
hecincome = Cashflow.create(id: 1, account_id: hecaccount.id, batch_id: janbatch.id, date: "2020-01-15", name: "Paycheck", flowtype: "Income", amount: 1000)
hecexpense = Cashflow.create(id: 2, account_id: hecaccount.id, batch_id: janbatch.id, date: "2020-01-28", name: "Cellphone", flowtype: "Expense", amount: 100)
