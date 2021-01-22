Rails.application.routes.draw do
  devise_for :users
  root to: 'out_syntheses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'out_syntheses/import', to: 'out_syntheses#import'
  get 'out_syntheses/controle', to: 'out_syntheses#controle'
  get 'contracheque_importations/portal_servidores_open', to: 'contracheque_importations#portal_servidores_open'
  get 'contracheque_importations/image_mechanize', to: 'contracheque_importations#image_mechanize'
  get 'out_syntheses/pdf_importer', to: 'out_syntheses#pdf_importer'
end
