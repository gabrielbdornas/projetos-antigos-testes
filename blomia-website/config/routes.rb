Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get '/ajuda', to: 'pages#ajuda'
  get '/historia', to: 'pages#historia'
  get '/para-pessoas', as: 'parapessoas', to: 'pages#parapessoas'
  get '/para-empresas', as: 'paraempresas', to: 'pages#paraempresas'
  get '/politica-de-privacidade', as: 'privacidade', to: 'pages#privacidade'
  get '/termos-de-uso', as: 'termos', to: 'pages#termos'
  get '/programa-de-afiliados', as: 'afiliado', to: 'pages#afiliado'
  get '/trabalhe-conosco', as: 'trabalhe', to: 'pages#trabalhe'

end
