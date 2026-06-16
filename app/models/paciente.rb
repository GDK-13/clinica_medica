class Paciente < ApplicationRecord
  # Associações entre os modelos, indicando que o paciente pode ter muitas consultas e muitos médicos através das consultas
  has_many :consultas, dependent: :destroy
  has_many :medicos, through: :consultas

  # Validações para garantir que os campos nome, data_nascimento e cpf sejam preenchidos e que o cpf seja único
  validates :nome, presence: true
  validates :data_nascimento, presence: true
  validates :cpf, presence: true, uniqueness: true
end