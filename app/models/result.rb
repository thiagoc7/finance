class Result
  attr_accessor :from, :to

  def initialize(from, to)
    @from = Date.new(from.first(4).to_i, from.last(2).to_i, 1)
    @to = Date.new(to.first(4).to_i, to.last(2).to_i, 15).end_of_month
  end

  def revenues
    Transaction.revenue.order(:category).from_to(from, to).group(:category).sum(:amount)
  end

  def total_revenues
    Transaction.revenue.from_to(from, to).sum(:amount)
  end

  def expenses
    Transaction.expense.order(:category).from_to(from, to).group(:category).sum(:amount)
  end

  def total_expenses
    Transaction.expense.from_to(from, to).sum(:amount)
  end

  def result
    total_revenues - total_expenses
  end
end