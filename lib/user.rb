class User < ActiveRecord::Base
  has_many :accounts, dependent: :destroy

  def to_s
    return "Name: #{first_name} #{last_name}"
  end
end
