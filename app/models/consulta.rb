class Consulta < ApplicationRecord
  # Associações entre os modelos, indicando que a consulta pertence a um médico e a um paciente 
  belongs_to :medico
  belongs_to :paciente

  # Validações para garantir que os campos médico, paciente e data_hora sejam preenchidos
  validates :data_hora, presence: true
end