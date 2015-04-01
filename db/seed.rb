require_relative 'connection'
require_relative 'lib/user'
require_relative 'lib/account'

User.destroy_all
Account.destroy_all


users = User.create([
  {name: "bob"},
  {name: "tom"},
  {name: "sam"},
  {name: "tim"}
])

bob = User.find_by(name:"bob")
bobs_accounts = bob.accounts.create([
  {name: "checking"},
  {name: "saving"}
])

tom = User.find_by(name:"tom")
toms_accounts = tom.accounts.create([
  {name: "tom1"},
  {name: "tommy2"},
  {name: "thomas3"}
])
