class Animal < ApplicationRecord
  self.table_name = 'animais'
  belongs_to :pessoa
end
