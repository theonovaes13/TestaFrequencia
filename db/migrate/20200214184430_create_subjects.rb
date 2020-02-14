class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :nome
      t.string :dias_semana
      t.time :hora_inicio
      t.time :hora_termino
      t.integer :capacidade
      t.integer :professor_id

      t.timestamps
    end
  end
end
