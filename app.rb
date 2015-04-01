require 'active_record'
require 'pry'

require_relative 'db/connection'
require_relative 'lib/account'
require_relative 'lib/user'


class Bank
  def initialize(name)
    @name = name
    @accounts = []
  end

  def name
    @name
  end

  def accounts
    @accounts
  end

end




binding.pry
