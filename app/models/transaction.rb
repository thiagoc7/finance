class Transaction < ApplicationRecord
  enum transaction_type: [:expense, :revenue, :transfer]

  validates_presence_of :date, :amount, :transaction_type, :account_id
  validates_presence_of :transfer_to_account_id, if: :transfer?
  validates_presence_of  :category, unless: :transfer?

  def icon
    if revenue?
      'arrow-up'
    else
      'arrow-down'
    end
  end

end
