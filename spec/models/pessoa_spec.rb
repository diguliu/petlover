require 'rails_helper'

RSpec.describe Pessoa, type: :model do
  describe 'associações' do
    it { have_many(:animais) }
  end

  describe '#idade' do
    it 'apresenta idade em anos' do
      menor = Pessoa.new(data_de_nascimento: 18.years.ago + 1.day)
      maior = Pessoa.new(data_de_nascimento: 18.years.ago - 1.day)

      expect(menor.idade).to eql(17)
      expect(maior.idade).to eql(18)
    end
  end

  describe '#menor?' do
    it 'verdadeiro se for menor' do
      menor = Pessoa.new(data_de_nascimento: 18.years.ago + 1.day)
      expect(menor.menor?).to be_truthy
    end
  end

  describe '#comecada_em_a?' do
    it 'nome da pessoa comeca com a' do
      p1 = Pessoa.new(nome: 'Augusto')
      p2 = Pessoa.new(nome: 'ana')
      p3 = Pessoa.new(nome: 'Bia')

      expect(p1.comecada_em_a?).to be_truthy
      expect(p2.comecada_em_a?).to be_truthy
      expect(p3.comecada_em_a?).to be_falsey
    end
  end

  describe '#custo_total' do
    it 'custo total da pessoa com base em seus animais' do
      pessoa = Pessoa.create!(nome: 'Augusto')
      a1 = Animal.create!(pessoa: pessoa, custo_mensal: 11.11)
      a2 = Animal.create!(pessoa: pessoa, custo_mensal: 22.22)
      a3 = Animal.create!(pessoa: pessoa, custo_mensal: 33.33)

      pessoa.reload

      custo_total = a1.custo_mensal + a2.custo_mensal + a3.custo_mensal

      expect(pessoa.custo_total).to eql(custo_total)
    end
  end

  describe 'alto_custo?' do
    it 'não considera alto custo valores menores ou igual a 1000' do
      pessoa = Pessoa.create!(nome: 'Augusto')
      allow(pessoa).to receive(:custo_total) { 1000 }

      expect(pessoa.alto_custo?).to be_falsey
    end

    it 'considera alto custo valores maiores que 1000' do
      pessoa = Pessoa.create!(nome: 'Augusto')
      allow(pessoa).to receive(:custo_total) { 1001 }

      expect(pessoa.alto_custo?).to be_truthy
    end
  end
end
