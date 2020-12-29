#Páginas

##Tópicos

###Home - 'pages#home'
- Página SEM necessidade de login
- Botão para criar novo tópico ('pages#new' / pages#create')
- Listar todos os tópicos (link para visualização do tópico 'pages#show')
- Botão para excluir tópico (somente se não tiver exemplos cadastrados - 'pages#destroy')

###Visualização de tópicos - 'pages#show'
- Página SEM necessidade de login
- Visualizar nome do tópico
- Visualizar conteúdo do tópico
- Visualizar link do youtube do conteúdo
- Botão para editar tópico ('pages#edit' / pages#update')
- Botão para excluir tópico (somente se não tiver exemplos cadastrados - 'pages#destroy')
- listar todos os exemplos ('example#index') com link para visualização do exemplo ('example#show')
- Botão para excluir exemplo (example#destroy)

###Edição de tópicos - 'pages#edit' / pages#update'
- Página COM necessidade de login
- Visualizar campo com nome do tópico pré-preenchido
- Visualizar campo com conteúdo do tópico pré-preenchido
- Visualizar campo com link do youtube do conteúdo pré-preenchido

##Exemplos

###Visualização de exemplo - 'exemplo#show'
- Página SEM necessidade de login
- Renderizar em nova aba modelo empty com página do exemplo

###Edição de exemplo - 'example#edit' / example#update'
- Página COM necessidade de login
- Visualizar campo com example_topic pré-preenchido
- Visualizar campo com conteudo do tópico pré-preenchido
