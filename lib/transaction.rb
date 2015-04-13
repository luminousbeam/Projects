class Transaction < ActiveRecord::Base
  belongs_to :account

  def to_s
    return "Payee: #{payee}\nDate: #{tdate}\nAmount: #{amount}\nCategory: #{category}"
  end
end
