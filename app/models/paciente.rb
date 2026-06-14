class Paciente < ApplicationRecord
  # Associações
  has_many :consultas, dependent: :destroy
  has_many :medicos, through: :consultas

  # Validações
  validates :nome, presence: true
  validates :data_nascimento, presence: true
  validates :cpf, presence: true, uniqueness: true
end