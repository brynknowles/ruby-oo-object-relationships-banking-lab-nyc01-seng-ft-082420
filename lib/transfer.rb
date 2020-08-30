require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end


  ##old method without reject_transfer method

  # def execute_transaction
  #   if !self.sender.valid?
  #     "Transaction rejected. Please check your account balance."
  #   elsif self.status == "pending"  && self.sender.valid?
  #     self.sender.balance -= self.amount
  #     self.receiver.balance += self.amount
  #     self.status = "complete"
  #   end
  # end

  ##new execute_transaction method with reject_transfer method

  def execute_transaction 
    if !valid? || sender.balance < amount
      reject_transfer
    elsif valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end

## SOLUTION TO COMPARE

# class Transfer
#   attr_reader :amount, :sender, :receiver
#   attr_accessor :status

#   def initialize(sender, receiver, amount)
#     @status = "pending"
#     @sender = sender
#     @receiver = receiver
#     @amount = amount
#   end

#   def valid?
#     sender.valid? && receiver.valid?
#   end

#   def execute_transaction
#     if valid? && sender.balance > amount && self.status == "pending"
#       sender.balance -= amount
#       receiver.balance += amount
#       self.status = "complete"
#     else
#       reject_transfer
#     end
#   end

#   def reverse_transfer
#     if valid? && receiver.balance > amount && self.status == "complete"
#       receiver.balance -= amount
#       sender.balance += amount
#       self.status = "reversed"
#     else
#       reject_transfer
#     end
#   end

#   def reject_transfer
#     self.status = "rejected"
#     "Transaction rejected. Please check your account balance."
#   end
# end

# binding.pry

## Tests

new_transaction1 = Transfer.new("Bryn", "Jake", 100)




