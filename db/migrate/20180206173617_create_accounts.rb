class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :initial_balance, default: 0
      t.boolean :investment, default: false

      t.timestamps
    end
  end
end
