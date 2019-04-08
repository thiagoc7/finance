class Account < ApplicationRecord
  enum kind: [:bank, :asset]

  has_many :transactions
  has_many :related_transactions, class_name:'Transaction', foreign_key: :related_account_id

  validates_presence_of :name, :kind
  validates_uniqueness_of :name

  def all_transactions
    Transaction.where(account_id: id).or(Transaction.where(related_account_id: id))
  end

  def dropdown_name
    kind + ' - ' + name
  end

  def begin_balance(month)
    date = month.beginning_of_month - 1
    balance_until date
  end

  def end_balance(month)
    balance_until month.end_of_month
  end

  def result(from, to)
    end_balance(to) - begin_balance(from)
  end

  def balance_until(date)
    positive = transactions.until(date).positives.total +
        related_transactions.until(date).negatives.total

    negative = transactions.until(date).negatives.total +
        related_transactions.until(date).positives.total

    initial_balance + positive - negative
  end
end
