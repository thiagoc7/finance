Rails.application.routes.draw do
  resources :transactions
  resources :accounts
  root to: 'pages#index'
end
