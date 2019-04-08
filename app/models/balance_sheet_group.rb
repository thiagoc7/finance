class BalanceSheetGroup

  attr_accessor :name, :accounts

  def initialize(from, to, name, use_kind = false)
    @from = from
    @to = to
    @name = name
    @use_kind = use_kind
    @accounts = find_accounts
  end

  def begin_balance
    @accounts.map(&:begin_balance).inject(0, &:+)
  end

  def end_balance
    @accounts.map(&:end_balance).inject(0, &:+)
  end

  def result
    end_balance - begin_balance
  end

  private
  def find_accounts
    result = []
    accounts = @use_kind ? Account.where(group: '').where(kind: name) : Account.where(group: @name)

    accounts.each do |account|
      result << BalanceSheetAccount.new(@from, @to, account)
    end

    result
  end
end