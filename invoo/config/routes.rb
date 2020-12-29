Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get 'home', to: 'pages#home'
  get 'exceptions', to: 'pages#exceptions'
  get 'from-to', to: 'pages#from_to'
  get 'balancete', to: 'pages#balancete'
  get 'balanco-patrimonial', to: 'pages#balance_sheet'
  get 'default_login', to: 'companies#default_login'
  get 'teste', to: 'import_account#teste'

  resources :companies do
    member do
      post :company_session
    end
    resources :import_accounts do
      collection do
        post :import
        get :edit
        patch :update
      end
    end
    resources :balance_sheets, only: [:index] do
      collection do
        get :graphs
      end
    end
    resources :dre, only: [:index] do
      collection do
        get :graphs
      end
    end
    resources :from_to, only: [:index]
    resources :exceptions, only: [:index]
    resources :orders
  end
end
