class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.date :date
      t.references :account
      t.text :category
      t.integer :amount
      t.text :comments
      t.integer :transaction_type
      t.integer :transfer_to_account_id

      t.timestamps
    end
  end
end
