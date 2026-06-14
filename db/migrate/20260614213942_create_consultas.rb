class CreateConsultas < ActiveRecord::Migration[8.1]
  def change
    create_table :consultas do |t|
      t.references :medico, null: false, foreign_key: true
      t.references :paciente, null: false, foreign_key: true
      t.datetime :data_hora
      t.text :observacoes

      t.timestamps
    end
  end
end
