require 'pry'

class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            true
        else
            false
        end
    end

    def close_account
        self.status = "closed"
    end


end

## SOLUTION TO COMPARE

# class BankAccount
#     attr_reader :name
#     attr_accessor :balance, :status

#     def initialize(name)
#       @name = name
#       @balance = 1000
#       @status = "open"
#     end

#     def deposit(deposit_amount)
#       self.balance += deposit_amount
#     end

#     def display_balance
#       "Your balance is $#{balance}."
#     end

#     def close_account
#       self.status = "closed"
#     end

#     def valid?
#       balance > 0 && status == "open"
#     end

#   end

# binding.pry


## Tests

# new_account1 = BankAccount.new("Bryn")
# new_account2 = BankAccount.new("Jake")

# new_account1
# new_account2

# new_account1.balance
# new_account2.balance

# new_account1.status
# new_account2.status