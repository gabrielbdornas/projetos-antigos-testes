# TODO

## Criar tabelas conforme banco de dados - https://kitt.lewagon.com/db/20954

[x] Criar tabela categories (criação, seed e conferência)

```
terminal

$ rails g model category name:string
```

```
# seed file

curso_superior = Category.create(name:'Curso Superior')
curso_livre = Category.create(name: 'Curso Livre')
```

```
terminal

$ rails db:create db:migrate db:seed
$ rails c
> Category.count # RESULTADO TEM QUE SER IGUAL A 2
```

[x] Criar tabela categories (criaçao, relaçoes, seed e conferências)

```
terminal

$ rails g model sub-category category:references name:string
```

```
sub-category model

belongs_to :category
```

```
category model

has_many :sub_categories
```

```
# seed file

graduacao = SubCategory.create(name:'Graduação', category:curso_superior)
pos_graduacao = SubCategory.create(name:'Pós-Graduação', category:curso_superior)
idioma = SubCategory.create(name:'Idioma', category:curso_livre)
tecnologia = SubCategory.create(name:'Tecnologia', category:curso_livre)
gestao = SubCategory.create(name:'Gestao', category:curso_livre)
```

```
terminal

$ rails db:drop db:create db:migrate db:seed
$ rails c
> Category.count # RESULTADO TEM QUE SER IGUAL A 2
> SubCategory.count # RESULTADO TEM QUE SER IGUAL A 5
> SubCategory.where(category_id: 1).count # RESULTADO TEM QUE SER IGUAL A 2
> SubCategory.where(category_id: 2).count # RESULTADO TEM QUE SER IGUAL A 3
> curso_superior = Category.first
> curso_livre = Category.second
> SubCategory.where(category:curso_superior).count # RESULTADO TEM QUE SER IGUAL A 2
> SubCategory.where(category:curso_livre).count # RESULTADO TEM QUE SER IGUAL A 3
```

[x] Criar tabela levels (criaçao, relaçoes, seed e conferências)

```
terminal

$ rails g model level sub_category:references name:string
```

```
level model

belongs_to :sub_category
```

```
sub-category model

has_many :levels
```

```
# seed file

bacharelado = Level.create(name:'Bacharelado', sub_category:graduacao)
licenciatura = Level.create(name:'Licenciatura', sub_category:graduacao)
graduacao_tecnologica = Level.create(name:'Graduação Tecnológica', sub_category:graduacao)
especializacao = Level.create(name:'Especialização', sub_category:pos_graduacao)
mba = Level.create(name:'MBA', sub_category:pos_graduacao)
mestrado = Level.create(name:'Mestrado', sub_category:pos_graduacao)
doutorado = Level.create(name:'doutorado', sub_category:pos_graduacao)
na_idioma = Level.create(name:'n/a', sub_category:idioma)
na_tecnologia = Level.create(name:'n/a', sub_category:tecnologia)
na_gestao = Level.create(name:'n/a', sub_category:gestao)
```

```
terminal

$ rails db:drop db:create db:migrate db:seed
$ rails c
> Category.count # RESULTADO TEM QUE SER IGUAL A 2
> SubCategory.count # RESULTADO TEM QUE SER IGUAL A 5
> Level.count # RESULTADO TEM QUE SER IGUAL A 10
> Level.where(sub_category_id: 1).count # RESULTADO TEM QUE SER IGUAL A 3
> Level.where(sub_category_id: 2).count # RESULTADO TEM QUE SER IGUAL A 4
> Level.where(sub_category_id: 3).count # RESULTADO TEM QUE SER IGUAL A 1
> Level.where(sub_category_id: 4).count # RESULTADO TEM QUE SER IGUAL A 1
> Level.where(sub_category_id: 5).count # RESULTADO TEM QUE SER IGUAL A 1
> graduacao = SubCategory.first
> pos_graduacao = SubCategory.second
> idioma = SubCategory.third
> tecnologia = SubCategory.find(4)
> gestao = SubCategory.find(5)
> Level.where(sub_category: graduacao).count # RESULTADO TEM QUE SER IGUAL A 3
> Level.where(sub_category: pos_graduacao).count # RESULTADO TEM QUE SER IGUAL A 4
> Level.where(sub_category: idioma).count # RESULTADO TEM QUE SER IGUAL A 1
> Level.where(sub_category: tecnologia).count # RESULTADO TEM QUE SER IGUAL A 1
> Level.where(sub_category: gestao).count # RESULTADO TEM QUE SER IGUAL A 1
```

[x] Criar tabela manteiners (criação e seed e conferência)

```
terminal

$ rails g model manteiner name:string
```

```
# seed file

anima = Manteiner.create(name:'Anima')
```

```
terminal

$ rails db:drop db:create db:migrate db:seed
$ rails c
> Manteiner.count # RESULTADO TEM QUE SER IGUAL A 1
```

[x] Criar tabela brands (criaçao, relaçoes, seed e conferências)

```
terminal

$ rails g model brand manteiner:references name:string
```

```
brand model

belongs_to :manteiner
```

```
manteiner model

has_many :brands
```

```
# seed file

una = Brand.create(name:'UNA', manteiner:anima)
uni_bh = Brand.create(name:'UNI BH', manteiner:anima)
sociesc = Brand.create(name:'SOCIESC', manteiner:anima)
usjt = Brand.create(name:'USJT', manteiner:anima)
```

```
terminal

$ rails db:drop db:create db:migrate db:seed
$ rails c
> Brand.count # RESULTADO TEM QUE SER IGUAL A 4
> anima = Manteiner.first
> Brand.where(manteiner:anima).count # RESULTADO TEM QUE SER IGUAL A 4
```

[x] Criar tabela units (criaçao, relaçoes, seed e conferências)

```
terminal

$ rails g model unity brand:references name:string state:string city:string neighborhood:string address:string zip_code:string
```

```
unity model

belongs_to :brand
```

```
brand model

has_many :unities
```

```
# seed file

unity_1 = Unity.create(brand:una, name:'Aimorés', state:'MG', city:'Belo Horizonte', neighborhood:'Funcionários', address:'Rua dos Aimorés, 1451', zip_code:'30140-071')
unity_2 = Unity.create(brand:una, name:'Barreiro', state:'MG', city:'Belo Horizonte', neighborhood:'Barreiro', address:'Av. Afonso Vaz de Melo, 465', zip_code:'30640-070')
unity_3 = Unity.create(brand:una, name:'Betim', state:'MG', city:'Betim', neighborhood:'Centro', address:'Av. Gov. Valadares, 640', zip_code:'32510-010')
unity_4 = Unity.create(brand:una, name:'Bom Despacho', state:'MG', city:'Bom Despacho', neighborhood:'Bom Despacho', address:'Rodovia BR-262, Km 480', zip_code:'35600-000')
unity_5 = Unity.create(brand:una, name:'Campus Una Uberlandia Centro', state:'MG', city:'Uberlândia', neighborhood:' Martins', address:'Av. Vasconcelos Costa, 321', zip_code:'38400-448')
unity_6 = Unity.create(brand:una, name:'CESUC - Ademar Ferrugem', state:'MG', city:'Catalão', neighborhood:'Santo Antonio', address:'R. Ademar Ferrugem, 840', zip_code:'75701-655')
unity_7 = Unity.create(brand:una, name:'CESUC - Paulo de Lima', state:'MG', city:'Catalão', neighborhood:'Santo Cruz', address:'Rua Professor Paulo Lima, 100', zip_code:'75706-725')
unity_8 = Unity.create(brand:una, name:'Contagem', state:'MG', city:'Contagem', neighborhood:'Eldorado', address:'Av. João César de Oliveira, 5775', zip_code:'32040-000')
unity_9 = Unity.create(brand:una, name:'Divinópolis', state:'MG', city:'Divinópolis', neighborhood:'Centro', address:'R. Cel. João Notini, 151', zip_code:'35500-017')
unity_10 = Unity.create(brand:una, name:'Guajajaras', state:'MG', city:'Belo Horizonte', neighborhood:'Centro', address:'Rua dos Guajajaras, 175', zip_code:'30180-100')
unity_11 = Unity.create(brand:una, name:'Jataí', state:'MG', city:'Jataí', neighborhood:'St. Antena', address:'R. José de Carvalho, 1800', zip_code:'75805-060')
unity_12 = Unity.create(brand:una, name:'Liberdade', state:'MG', city:'Belo Horizonte', neighborhood:'Centro', address:'R. da Bahia, 1764', zip_code:'30160-011')
unity_13 = Unity.create(brand:una, name:'Linha Verde', state:'MG', city:'Belo Horizonte', neighborhood:'Suzana', address:'Av. Cristiano Machado, 11157', zip_code:'31744-007')
unity_14 = Unity.create(brand:una, name:'Nova Serrana', state:'MG', city:'Nova Serrana', neighborhood:'São José', address:'Rua Antônio Paulino Ferreira, 100', zip_code:'35519-000')
unity_15 = Unity.create(brand:una, name:'Pouso Alegre', state:'MG', city:'Pouso Alegre', neighborhood:'Centro', address:'Rua João Basílio, 420', zip_code:'37550-000')
unity_16 = Unity.create(brand:una, name:'Sete Lagoas', state:'MG', city:'Sete Lagoas', neighborhood:'São Jorge', address:'Av. Secretário Divino Padrão, 1411', zip_code:'35702-075')
unity_17 = Unity.create(brand:una, name:'Uberlândia - Karaiba', state:'MG', city:'Uberlândia', neighborhood:'Jardim das Acacias', address:'Al. Paulina Margonari, 59', zip_code:'38411-206')
unity_18 = Unity.create(brand:una, name:'Unidade Acadêmica Conselheiro Lafaiete', state:'MG', city:'Conselheiro Lafaiete', neighborhood:'Santa Efigênia', address:'R. Melvin Jones – 90', zip_code:'36400-000')
unity_19 = Unity.create(brand:una, name:'Unidade Acadêmica Itabira', state:'MG', city:'Itabira', neighborhood:'Centro', address:'Rua Doutor Sizenando de Barros, 27', zip_code:'35900-006')
unity_20 = Unity.create(brand:una, name:'Unidade Acadêmica Itumbiara', state:'MG', city:'Itumbiara', neighborhood:'Centro', address:'Av. Santos Dumont - 997', zip_code:'75503-222')
```

```
terminal

$ rails db:drop db:create db:migrate db:seed
$ rails c
> Unity.count # RESULTADO TEM QUE SER IGUAL A 20
> una = Brand.first
> Unity.where(brand:una).count # RESULTADO TEM QUE SER IGUAL A 20
```

[x] Mudar schema - conforme https://kitt.lewagon.com/db/20954 (reunião 04/12/2020)

[x] Novo seed courses

terminal

```
$ rails db:drop db:create db:migrate db:seed
$ rails c
> Course.count # RESULTADO TEM QUE SER IGUAL A 51
> bacharelado = Level.first
> licenciatura = Level.second
> graduacao_tecnologica = Level.third
> Course.where(level:bacharelado).count # RESULTADO TEM QUE SER IGUAL A 33
> Course.where(level:licenciatura).count # RESULTADO TEM QUE SER IGUAL A 2
> Course.where(level:graduacao_tecnologica).count # RESULTADO TEM QUE SER IGUAL A 16
```

[x] criar tabela course_configurations

```
# terminal

rails g model CourseConfiguration unity:references course:references modality:string semesters_duration:integer period:string status:boolean value:float
```

```
# CourseConfiguration model

belongs_to :unity
belongs_to :course
```

```
# Course model

has_many :course_configurations
```

```
# Unity model

has_many :course_configurations
```

```
# seed

# muito grande, incluí no próprio arquivo
```

[x] Criar filtro para categoria (curso livre, curso superior)

```
# terminal

rails g controller Categories
```
--método no controller e rota

[x] Criar filtro para sub_categoria (graduacao, Idiomas...)

```
# terminal

rails g controller SubCategories
```
--view, método no controller e rota

-- para receber a variável @sub_categories_search basta acessar a rota: sub_categories/index_search?category=Curso Livre / sub_categories/index_search?category=Curso Superior

[x] Criar filtro para level (Bacharelado, Licenciatura...)

```
# terminal

rails g controller Levels
```
--view, método no controller e rota

[ ] Filtro cidade/estado?
[ ] Filtro Curso

