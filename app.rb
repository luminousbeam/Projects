require 'active_record'
#require 'pry'

require_relative 'db/connection'
require_relative 'lib/account'
require_relative 'lib/transaction'

def get_account
  puts "Which account would you like to access?"
  puts Account.all
  account_choice = gets.chomp
  return Account.find_by(name: account_choice)
end

def get_trans(account)
  puts "Which transaction?"
  puts account.transactions
  trans_name = gets.chomp
  return account.transactions.find_by(payee: trans_name)
end

def get_account_input
  account_attr = {}
  puts "Enter new account name:"
  account_attr[:name] = gets.chomp
  return account_attr
end

def get_trans_input
  trans_attr = {}
  puts "Enter the transaction payee:"
  trans_attr[:payee] = gets.chomp
  puts "Enter the transaction purchase date:"
  trans_attr[:tdate] = gets.chomp
  puts "Enter the transaction amount:"
  trans_attr[:amount] = gets.chomp
  puts "Do you want to withdraw or deposit?"
  trans_attr[:category] = gets.chomp
  return trans_attr
end


def menu
  puts "Choose option:
  1. List all accounts
  2. Add an account
  3. Delete an account
  4. List all transactions within an account
  5. Add a transaction
  6. Delete a transaction
  7. Get balance
  8. Quit"
  return gets.chomp
end

loop do

  choice = menu
  case choice

  when "1" #lists all accounts
    puts Account.all
  when "2" #add an account
    Account.create(get_account_input)
  when "3" #delete an account
    account = get_account
    account.destroy
  when "4" #list all transactions
    account = get_account
    puts account.transactions
  when "5" #add transaction
    account = get_account
    new_trans = Transaction.create(get_trans_input)
    new_trans.account = account
      if Transaction.where(category: "withdraw")
        new_trans.neg
      else
        new_trans.save
      end
  when "6" #delete transaction
    account = get_account
    transaction = get_trans(account)
    transaction.destroy
  when "7" #get sum of transaction type
    account = get_account
    puts Transaction.where(account_id: account.id).sum(:amount)
  when "8"
    break
  end
end
