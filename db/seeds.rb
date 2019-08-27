# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Criação de pessoas
p1 = Pessoa.create!(nome: 'Johnny Cash',     documento: 555555555, data_de_nascimento: Date.new(1932, 2, 26))
p2 = Pessoa.create!(nome: 'Sid Vicious',     documento: 555555555, data_de_nascimento: Date.new(1957, 5, 10))
p3 = Pessoa.create!(nome: 'Axl Rose',        documento: 555555555, data_de_nascimento: Date.new(1962, 2, 6 ))
p4 = Pessoa.create!(nome: 'Joey Ramone',     documento: 555555555, data_de_nascimento: Date.new(1951, 5, 19))
p5 = Pessoa.create!(nome: 'Bruce Dickinson', documento: 555555555, data_de_nascimento: Date.new(1958, 8, 7 ))
p6 = Pessoa.create!(nome: 'Kurt Cobain',     documento: 555555555, data_de_nascimento: Date.new(1967, 2, 20))
p7 = Pessoa.create!(nome: 'Elvis Presley',   documento: 555555555, data_de_nascimento: Date.new(2008, 8, 17))

# Criação de animais

Animal.create!(nome: 'Pé de Pano',              custo_mensal: 199.99, tipo: 'Cavalo',       pessoa: p1)
Animal.create!(nome: 'Rex',                     custo_mensal: 99.99 , tipo: 'Cachorro',     pessoa: p2)
Animal.create!(nome: 'Ajudante do Papai Noel',  custo_mensal: 99.99 , tipo: 'Cachorro',     pessoa: p3)
Animal.create!(nome: 'Rex',                     custo_mensal: 103.99, tipo: 'Papagaio',     pessoa: p4)
Animal.create!(nome: 'Flora',                   custo_mensal: 103.99, tipo: 'Lhama',        pessoa: p5)
Animal.create!(nome: 'Dino',                    custo_mensal: 177.99, tipo: 'Iguana',       pessoa: p6)
Animal.create!(nome: 'Lassie',                  custo_mensal: 407.99, tipo: 'Ornitorrinco', pessoa: p7)
