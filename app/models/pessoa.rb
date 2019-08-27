class Pessoa < ApplicationRecord
  has_many :animais, class_name: 'Animal'

  def menor?
    idade < 18
  end

  def idade
    ((Time.zone.now - data_de_nascimento.to_time) / 1.year.seconds).floor
  end

  def comecada_em_a?
    nome.to_s.downcase[0] == 'a'
  end

  def custo_total
    animais.inject(0) { |total, animal| total + animal.custo_mensal }
  end

  def alto_custo?
    custo_total > 1000
  end
end
