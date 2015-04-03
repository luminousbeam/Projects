class Account < ActiveRecord::Base
  has_many :transactions, dependent: :destroy
  validates :name, presence: true

  def to_s
    return "Name: #{name}"
  end

end
