class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.date :date
      t.integer :kind
      t.references :account
      t.integer :amount
      t.text :category
      t.integer :related_account_id
      t.text :comments

      t.timestamps
    end
  end
end
