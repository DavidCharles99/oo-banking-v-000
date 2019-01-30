class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
def valid?
  if @sender.valid? && @receiver.valid?
    true
  else
    false
  end
end
 def execute_transaction
   
     if @status == "pending"
  @sender.balance -= @amount
  @receiver.balance += @amount
  @status = "complete"
end
end

 def reverse_transfer
    if @status == "complete" && @receiver.balance >= @amount && @receiver.status == "open"
      @sender.balance += @amount
    @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
