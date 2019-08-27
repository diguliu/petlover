# Desafio de código Backend Ruby

## Questões

As questões devem ser respondidas com queries do `ActiveRecord`.
Inclua os trechos de código que respondem as perguntas abaixo:

### Qual é o custo médio dos animais do tipo cachorro?

```
> Animal.where(tipo: 'Cachorro').average(:custo_mensal).to_f
=> 99.99
```

### Quantos cachorros existem no sistema?

```
> Animal.where(tipo: 'Cachorro').count
=> 2
```

### Qual o nome dos donos dos cachorros (Array de nomes)

```
> Pessoa.joins(:animais).where(animais: {tipo: 'Cachorro'}).map(&:nome)
=> ["Sid Vicious", "Axl Rose"]
```

### Retorne as pessoas ordenando pelo custo que elas tem com os animais (Maior para menor)

```
> Pessoa.select('pessoas.nome, sum(animais.custo_mensal) as custo').joins(:animais).group(:nome).order('custo DESC').inject({}) { |hash, p|  hash[p.nome] = p.custo ; hash }
=> {"Elvis Presley"=>407.99, "Johnny Cash"=>199.99, "Kurt Cobain"=>177.99, "Bruce Dickinson"=>103.99, "Joey Ramone"=>103.99, "Sid Vicious"=>99.99, "Axl Rose"=>99.99}
```
### Levando em consideração o custo mensal, qual será o custo de 3 meses de cada pessoa?

```
> Pessoa.select('pessoas.nome, sum(animais.custo_mensal) * 3 as custo').joins(:animais).group(:nome).inject({}) { |hash, p|  hash[p.nome] = p.custo ; hash }
=> {"Johnny Cash"=>599.97, "Sid Vicious"=>299.97, "Axl Rose"=>299.97, "Joey Ramone"=>311.97, "Bruce Dickinson"=>311.97, "Kurt Cobain"=>533.97, "Elvis Presley"=>1223.97}
```

# Entrega do projeto

- Crie uma aplicação Rails nova para executar o desafio. Pode escolher o banco de dados de preferência.
- Ao finalizar, suba a sua proposta para o projeto que você criou no GitHub. Exemplo: https://github.com/seuNome/pet-code;
- Envie-nos o link do projeto. Exemplo: https://github.com/seuNome/test-backend-ruby.git
- Pronto! Basta aguardar o nosso RH entrar em contato. Entramos em contato rapidinho ;)
