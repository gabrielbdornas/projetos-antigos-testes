Rails.application.routes.draw do
  devise_for :users


  resource :supplies
  root to: 'supplies#new'
end
