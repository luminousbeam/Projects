class Transaction < ActiveRecord::Base
  belongs_to :account

  def to_s
    return
   "Payee: #{payee}
    Date: #{tdate}
    Amount: #{amount}
    Category: #{category}"
  end
end
