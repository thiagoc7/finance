Rails.application.routes.draw do
  resources :accounts
  root to: 'pages#index'
end
