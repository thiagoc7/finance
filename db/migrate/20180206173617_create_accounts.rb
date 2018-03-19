class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :kind
      t.integer :initial_balance, default: 0

      t.timestamps
    end
  end
end
