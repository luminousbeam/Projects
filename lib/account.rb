class Account < ActiveRecord::Base
  belongs_to :user

  def to_s
    return name
  end
end
