class Account < ActiveRecord::Base
  has_many :transactions, dependent: :destroy
  validates :name, presence: true

  def to_s
    return "Name: #{name}"
  end

  def deposit (amount)
    @balance += amount
  end

  def withdraw (amount)
    raise ArgumentError, "#{name} has insufficient funds."
      if @balance < amount
         @balance -= amount
      end
   end
end
