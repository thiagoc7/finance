Rails.application.routes.draw do
  get 'results/index'
  get 'balance_sheets/index'

  resources :transactions
  resources :accounts
  root to: 'transactions#index'
end
