json.extract! consulta, :id, :medico_id, :paciente_id, :data_hora, :observacoes, :created_at, :updated_at
json.url consulta_url(consulta, format: :json)
