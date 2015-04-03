require_relative 'connection'
require_relative '../lib/account'
require_relative '../lib/transaction'

Transaction.destroy_all
Account.destroy_all

payees = ["Burger King", "McDonalds", "Wendy's"]
tdates = ["3/1/15", "3/25/15","4/1/15"]
categories = ["deposit", "withdrawal"]

account = Account.create(name: "Personal Checking")

20.times do
  account.transactions.create( payee: payees.sample, tdate: tdates.sample,
                               amount: rand(20), category: category.sample)
end
