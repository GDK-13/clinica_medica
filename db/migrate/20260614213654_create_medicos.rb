class CreateMedicos < ActiveRecord::Migration[8.1]
  def change
    create_table :medicos do |t|
      t.string :nome
      t.string :crm
      t.string :especialidade

      t.timestamps
    end
  end
end
