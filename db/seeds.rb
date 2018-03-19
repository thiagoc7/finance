
account = Account.create! name: 'Itau', kind: :bank, initial_balance: 100
Account.create! name: 'Bradesco', kind: :bank, initial_balance: 200
Account.create! name: 'Santander', kind: :bank

invest = Account.create! name: 'Fundo 1', kind: :investment
Account.create! name: 'Fundo 2', kind: :investment