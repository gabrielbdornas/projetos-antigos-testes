Rails.application.routes.draw do
  devise_for :users

  resources :pages do
    resources :examples, only: [ :show, :new, :create ]
  end

  resources :examples, only: [:edit, :update, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
