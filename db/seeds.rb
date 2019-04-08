
account = Account.create name: 'Itau', kind: :bank, initial_balance: 100
Account.create name: 'Bradesco', kind: :bank, initial_balance: 200
Account.create name: 'Santander', kind: :bank
Account.create name: 'XP', kind: :asset, initial_balance: 100, group: 'Broker'

invest = Account.create name: 'Fundo 1', kind: :asset
Account.create name: 'Fundo 2', kind: :asset, group: 'Broker'
Account.create name: 'Fundo 3', kind: :asset, group: 'Broker'

date = Date.today.last_month

Transaction.create date: date, kind: :expense, account: account, amount: 100, category: 'General'
Transaction.create date: date, kind: :expense, account: account, amount: 100, category: 'Car'
Transaction.create date: date, kind: :expense, account: account, amount: 150, category: 'Meal'
Transaction.create date: date, kind: :revenue, account: account, amount: 1500, category: 'Salary'
Transaction.create date: date, kind: :revenue, account: account, amount: 500, category: 'Rent'

Transaction.create date: date, kind: :buy, account: invest, amount: 700, related_account: account
Transaction.create date: date, kind: :sell, account: invest, amount: 300, related_account: account