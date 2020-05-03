# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboards#index'
  resources :expenses

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenses, only: [:index, :create]
    end
  end
end
