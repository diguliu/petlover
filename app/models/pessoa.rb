class Pessoa < ApplicationRecord
  has_many :animais, class_name: 'Animal'
end
