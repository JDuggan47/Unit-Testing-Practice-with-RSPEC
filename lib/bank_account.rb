class BankAccount
  attr_reader :account_number, :initial_deposit, :transactions

  def initialize(account_number, initial_deposit)
    @account_number = account_number
    @initial_deposit = initial_deposit
    @transactions = []
  end

  def add_transaction(amount)
    @transactions << amount
  end

  def current_balance
    results = initial_deposit
    @transactions.each do |transaction|
      results += transaction
    end
    results
  end

  def summary
    results = "Account Number: #{account_number}\n"
    results += "Initial Deposit: $#{pretty(initial_deposit)}\n"
    results += "Transactions:\n"

    transactions.each do |transaction|
      results += " $#{pretty(transaction)}"
    end

    results += "Current Balance: $#{pretty(current_balance)}"
  end

  private
  def pretty(amount)
    sprintf('%.2f', amount)
  end
end
