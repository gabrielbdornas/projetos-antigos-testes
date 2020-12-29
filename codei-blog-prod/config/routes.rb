Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'clean_blogs#index'
  get  'data_scraping'   => 'clean_blogs#data_scraping'
  get  'about'  => 'clean_blogs#about'
  get  'post'   => 'clean_blogs#post'
  get  'contact'  => 'clean_blogs#contact'
  get  'abrir'  => 'clean_blogs#abrir'
end
