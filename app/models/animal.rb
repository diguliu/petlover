class Animal < ApplicationRecord
  self.table_name = 'animais'
  belongs_to :pessoa

  validate :andorinhas_menor, if: Proc.new { |animal| animal.tipo == 'Andorinha' }
  validate :comecadas_em_a, if: Proc.new { |animal| animal.tipo == 'Gato' }
  validate :alto_custo

  def andorinhas_menor
    if pessoa.try(:menor?)
      errors.add(:pessoa, 'andorinha não pode ser de uma pessoa menor de idade')
    end
  end

  def comecadas_em_a
    if pessoa.try(:comecada_em_a?)
      errors.add(:pessoa, 'gato não pode ser de uma pessoa cujo nome começa com "A"')
    end
  end

  def alto_custo
    if pessoa.try(:alto_custo?)
      errors.add(:pessoa, 'essa pessoa não pode ter mais animais pois ela já tem um alto custo')
    end
  end
end
