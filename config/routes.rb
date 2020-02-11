Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/cashflows/date/:date', to: 'cashflows#index'
  get '/cashflows/:id', to: 'cashflows#show'
  post '/cashflows/:id', to: 'cashflows#destroy'
  get '/cashflows/income/:date', to: 'cashflows#income'
  get '/cashflows/income', to: 'cashflows#income'
  get '/cashflows/expense/:date', to: 'cashflows#expense'
  get '/cashflows/expense', to: 'cashflows#expense'
  get '/cashflows/balance/:date', to: 'cashflows#balance'
  get '/cashflows/balance', to: 'cashflows#balance'
  get '/cashflows/spend_allowance/:date', to: 'cashflows#spend_allowance'
  get '/cashflows/find_end_date/:date', to: 'cashflows#find_end_date'
  resources :users, :accounts, :cashflows, :batches
end
