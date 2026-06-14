json.extract! medico, :id, :nome, :crm, :especialidade, :created_at, :updated_at
json.url medico_url(medico, format: :json)
