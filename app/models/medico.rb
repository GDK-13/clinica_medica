class Medico < ApplicationRecord
  # Associações entre os modelos, indicando que o médico pode ter muitas consultas e muitos pacientes através das consultas
  has_many :consultas, dependent: :destroy
  has_many :pacientes, through: :consultas

  # Validações para garantir que os campos nome, especialidade e crm sejam preenchidos e que o crm seja único
  validates :nome, presence: true
  validates :especialidade, presence: true
  validates :crm, presence: true, uniqueness: true
end