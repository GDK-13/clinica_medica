class Medico < ApplicationRecord
  # Associações
  has_many :consultas, dependent: :destroy
  has_many :pacientes, through: :consultas

  # Validações
  validates :nome, presence: true
  validates :especialidade, presence: true
  validates :crm, presence: true, uniqueness: true
end