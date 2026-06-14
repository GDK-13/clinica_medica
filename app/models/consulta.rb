class Consulta < ApplicationRecord
  # Associações 
  belongs_to :medico
  belongs_to :paciente

  # Validações
  validates :data_hora, presence: true
end