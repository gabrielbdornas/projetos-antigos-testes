# Especificação do sistema - Pseudocódigo

[x] Criação de um painel admin para realizar operações CRUD em tabelas do banco de dados

- Para tanto foi instalada a gem rails_admin
```
# Gemfile

gem 'rails_admin'
```

```
# Terminal

$ bundle
$ rails g rails_admin:install
```

[x] Usuário tem que ser capaz de criar seu próprio cadastro

- Para tanto foi instalada a gem devise

```
# Gemfile

gem 'devise'
```

```
# Terminal

$ bundle
$ rails generate devise:install
$ rails generate devise User
```

```
# /config/initializers/rails_admin.rb

## == Devise ==
config.authenticate_with do
  warden.authenticate! scope: :user
end
config.current_user_method(&:current_user)
```

[] Atualização tabela users (apenas campos necessários para este momento)

- Modificação tabela users para deixar com os campos necessários

```
# db/migrate/20201120231230_create_users.rb

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
  end
end
```

```
# terminal

$ rails db:drop db:create db:migrate
```

[] Apagar tabelas que não farão parte do projeto (utilizadas no tutorial)

- Apagar arquivos: migrate e models:
* migrate/...create_clients.rb;
* migrate/...create_addresses.rb
* migrate/...create_products.rb
* migrate/...create_disconts.rb
* migrate/...create_product_quantities.rb
* migrate/...create_sales.rb
* migrate/...create_comissions.rb
* models/address.rb
* models/client.rb
* models/comission.rb
* models/discount.rb
* models/product.rb
* models/product_quantity.rb
* models/sale.rb


[] Usuário tem que conseguir cadastrar empresas. Usuário poderá ser vinculado a várias empresas e uma empresa poderá ter vários usuários

```
# terminal - criação tabelas companies e company_users

$ rails g model Company cnpj:string formal_name:string fantasy_name:string
$ rails g model CompanyUsers company:reference user:references
```

```
# Ajustar migration company_users com ", foreign_key: true" após as referencias

class CreateCompanyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :company_users do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

```

```
# Ajustar CompanyUser model

class CompanyUser < ApplicationRecord
  belongs_to :company
  belongs_to :user
end
```

```
# Ajustar Company Model

class Company < ApplicationRecord
  has_many :company_users
end
```

```
# Ajustar User Model

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :company_users
  has_many :companies, through: :company_users
end
```

```
# Terminal

$ rails db:drop db:create db:migrate
```

[] Usuário responsável pelo cadastro da empresa deverá ser vinculado à ela ao final do seu cadastro
