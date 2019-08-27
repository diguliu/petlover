require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'associações' do
    it { belong_to(:pessoa) }

    context 'andorinhas' do
      it 'não permite andorinhas com menores de 18 anos' do
        menor = Pessoa.new(data_de_nascimento: 18.years.ago + 1.day)
        animal = Animal.new(tipo: 'Andorinha', pessoa: menor)

        animal.valid?

        expect(animal.errors[:pessoa].size).to eql(1)
      end

      it 'permite andorinhas com maiores de 18 anos' do
        maior = Pessoa.new(data_de_nascimento: 18.years.ago - 1.day)
        animal = Animal.new(tipo: 'Andorinha', pessoa: maior)

        animal.valid?

        expect(animal.errors[:pessoa].size).to eql(0)
      end
    end

    context 'gatos' do
      it 'não permite gatos com pessoas de nome comaçado em A' do
        pessoa = Pessoa.new(nome: 'Augusto')
        animal = Animal.new(tipo: 'Gato', pessoa: pessoa)

        animal.valid?

        expect(animal.errors[:pessoa].size).to eql(1)
      end

      it 'permite gatos com pessoas de nome começados em outras letras' do
        p1 = Pessoa.new(nome: 'Pedro')
        p2 = Pessoa.new(nome: 'Bia')
        a1 = Animal.new(tipo: 'Gato', pessoa: p1)
        a2 = Animal.new(tipo: 'Gato', pessoa: p2)

        a1.valid?
        a2.valid?

        expect(a1.errors[:pessoa].size).to eql(0)
        expect(a2.errors[:pessoa].size).to eql(0)
      end
    end

    context 'custo total' do
      it 'não permite novo animal para pessoas com custo total acima de R$1.000' do
        pessoa = Pessoa.create!(nome: 'Augusto')
        Animal.create!(pessoa: pessoa, custo_mensal: 250)
        Animal.create!(pessoa: pessoa, custo_mensal: 500)
        Animal.create!(pessoa: pessoa, custo_mensal: 300)
        pessoa.reload
        animal = Animal.new(pessoa: pessoa)

        animal.valid?

        expect(animal.errors[:pessoa].size).to eql(1)
      end

      it 'permite novo animal para pessoas com custo total menor ou igual a R$1.000' do
        pessoa = Pessoa.create!(nome: 'Augusto')
        Animal.create!(pessoa: pessoa, custo_mensal: 250)
        Animal.create!(pessoa: pessoa, custo_mensal: 500)
        Animal.create!(pessoa: pessoa, custo_mensal: 250)
        pessoa.reload
        animal = Animal.new(pessoa: pessoa)

        animal.valid?

        expect(animal.errors[:pessoa].size).to eql(0)
      end
    end
  end
end
