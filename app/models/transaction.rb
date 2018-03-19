class Transaction < ApplicationRecord
  enum kind: [:expense, :revenue, :transfer, :buy, :sell]

  belongs_to :account
  belongs_to :related_account, class_name:'Account', foreign_key: :related_account_id, optional: true

  validates_presence_of :date, :amount, :kind, :account_id
  validates_presence_of :related_account_id, if: :needs_related_account?
  validates_presence_of  :category, unless: :needs_related_account?

  def self.default_scope
    order(:date)
  end

  def self.until(date)
    where('date <= ?', date)
  end

  def self.in_the_month_of(date)
    where(date: date.beginning_of_month..date.end_of_month)
  end

  def self.total
    sum(:amount)
  end

  def self.positives
    where(kind: [:revenue, :buy])
  end

  def self.negatives
    where(kind: [:expense, :transfer, :sell])
  end

  def spec
    return category if expense? || revenue?
    related_account.name
  end

  def kinds_for_account
    account.bank? ? %w(expense revenue transfer) : %w(expense revenue buy sell)
  end

  def positive?(related = false)
    result = (revenue? || buy?) ? true : false
    related ? !result : result
  end

  private
  def needs_related_account?
    %w(transfer buy sell).include? kind
  end
end
