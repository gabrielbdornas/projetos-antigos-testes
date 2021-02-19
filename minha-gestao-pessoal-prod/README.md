# README

Projeto de criação de sistema para gerenciar minha vida pessoal, com funcionalidades financeiras e de gestão de casa

[x] Sistema deverá ser capaz de realizar cadastros (CRUD completo) de diversas tabelas

```
# gemfile

gem 'rails_admin'
```

```
# terminal

bundle
rails g rails_admin:install
```

- Integração Devise:

```
# Gemfile

gem 'devise'
```

```
# terminal

bundle
rails generate devise:install
rails generate devise User
```
- Validações cadastro de usuário

```
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :recoverable -- para não deixar usuário se cadastrar ou recuperar senha
  devise :database_authenticatable, :rememberable, :validatable
  validates :email, presence: true
  validates :email, uniqueness: true

end
```


```
# /config/initializers/rails_admin.rb

## == Devise ==
config.authenticate_with do
  warden.authenticate! scope: :user
end
config.current_user_method(&:current_user)
```

- Criando seeds para os usuários

```
# /db/seeds.rb

User.create email: 'gabrielbdornas@gmail.com', password: 123456, password_confirmation:123456
User.create email: 'renatafldias@gmail.com', password: 123456, password_confirmation:123456
```

```
terminal

$ rails db:create db:migrate db:seed # utilizar db:drop caso já haja algum banco criado (não necessário se for a primeira vez)
```

- gem cancancan para permissões

```
# Gemfile

gem 'cancancan', '~> 1.15.0'
```

```
# terminal

$ bundle
$ rails g cancan:ability
```

```
# rails_admin initializer

# /config/initializers/rails_admin.rb

## == Cancan ==
config.authorize_with :cancan
```

- Cadastrando primeiras restrições

```
class Ability
  include CanCan::Ability

  def initialize(user)
 can :manage, :all
  end
end
```

[x] Criação de accounts model

Seguir modelo - https://db-creater.herokuapp.com/db_schemas/25

```
# terminal

rails g model Account code:string name:string type:string
rails db:migrate
```
-Problema enfrentado durante o comando "rails g". Solução encontrada em:
https://stackoverflow.com/questions/23157426/rails-generate-not-working


```
# /db/seeds.rb

Account.create code: '44250-X', name: 'Banco de Brasil Gabriel', type: 'Conta Bancária'
```



Cadastros em Prod

Cadastrar contas

- Banco do Brasil Renata
- Banco do Brasil Gabriel
- PicPay Renata
- PicPay Gabriel
- Iti Renata
- Iti Gabriel
- Visa Infinity Renata
- Visa Infinity Gabriel
- Elo Nanquin Renata
- Elo Nanquin Gabriel
- Visa Gold Lila
- Sicoob Gabriel
