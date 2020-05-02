Rails.application.routes.draw do
  root 'dashboards#index'
  resources :expenses, only: [:index]
end
