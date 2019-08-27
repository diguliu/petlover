class CreatePessoas < ActiveRecord::Migration[6.0]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :documento
      t.date :data_de_nascimento

      t.timestamps
    end
  end
end
