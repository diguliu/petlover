class CreateAnimais < ActiveRecord::Migration[6.0]
  def change
    create_table :animais do |t|
      t.string :nome
      t.float :custo_mensal
      t.string :tipo
      t.references :pessoa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
