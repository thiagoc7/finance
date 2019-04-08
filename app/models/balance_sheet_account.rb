class BalanceSheetAccount

  attr_accessor :account, :begin_balance, :end_balance

  def initialize(from, to, account)
    @from = from
    @to = to
    @account = account
    @begin_balance = @account.begin_balance(from)
    @end_balance = @account.end_balance(to)
  end

  def name
    @account.name
  end

  def result
    @end_balance - @begin_balance
  end

  def transactions
    @account.all_transactions.from_to(@from, @to)
  end
end