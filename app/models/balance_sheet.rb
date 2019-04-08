class BalanceSheet
  attr_accessor :from, :to, :groups

  def initialize(from, to)
    @from = Date.new(from.first(4).to_i, from.last(2).to_i, 1)
    @to = Date.new(to.first(4).to_i, to.last(2).to_i, 15).end_of_month
    @groups = find_groups
  end

  private

  def find_groups
    names = Account.all.pluck(:group)
    names.delete ''
    result = []

    Account.kinds.keys.each do |kind|
      result << BalanceSheetGroup.new(@from, @to, kind, true)
    end

    names.uniq.each do |name|
      result << BalanceSheetGroup.new(@from, @to, name)
    end

    result
  end
end