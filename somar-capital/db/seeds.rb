# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product_1 = Product.new(name: "Declaração Imposto de Renda 2020 - Pessoa Física",
            description: "Declarações de pessoa física, nas modalidades simples ou completa, de maneira rápida e segura. Não fique preocupado em perder o prazo ou realizar lançamentos incorretos e cair na malha fina ou pagar multas desnecessariamente.",
            photo_url: "https://somar-capital.s3-sa-east-1.amazonaws.com/irpf-2020.jpeg",
            price_cents: 100)

product_1.save

product_2 = Product.new(name: "Declaração Imposto de Renda 2019 - Pessoa Física",
            description: "Declarações de pessoa física, nas modalidades simples ou completa, de maneira rápida e segura. Não fique preocupado em perder o prazo ou realizar lançamentos incorretos e cair na malha fina ou pagar multas desnecessariamente.",
            photo_url: "https://somar-capital.s3-sa-east-1.amazonaws.com/irpf-2020.jpeg",
            price_cents: 100)

product_2.save

