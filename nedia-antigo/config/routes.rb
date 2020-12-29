Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'categories/index', to: 'categories#index'
  get 'sub_categories/index_search', to: 'sub_categories#index_search'
  get 'levels/index_search', to: 'levels#index_search'
end
