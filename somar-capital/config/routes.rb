Rails.application.routes.draw do
  devise_for :users
  resources :products, only: [:index, :show]
  resources :mercado_pago_payments, only: :new
  post 'products/processar_pagamento', to: 'products#processar_pagamento'
  root to: "products#index"
  get 'orders/show', to: 'orders#show', as: :processar_pagamento
  # resources :orders, only: [:show, :create] do
  #   resources :payments, only: :new
  # end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
