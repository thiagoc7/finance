json.extract! account, :id, :name, :initial_balance, :investment, :created_at, :updated_at
json.url account_url(account, format: :json)
