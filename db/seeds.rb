
Consulta.destroy_all
Medico.destroy_all
Paciente.destroy_all

medicos = [
  { nome: "Dra. Björk Guðmundsdóttir", crm: "11111-SP", especialidade: "Cardiologia" },
  { nome: "Dra. Lady Gaga", crm: "22222-RJ", especialidade: "Psiquiatria" },
  { nome: "Dra. Shanyqua Swift", crm: "33333-MG", especialidade: "Pediatria" },
  { nome: "Dra. Aurora Aksnes", crm: "44444-BA", especialidade: "Dermatologia" },
  { nome: "Dra. Kali Uchis", crm: "55555-RS", especialidade: "Cirurgia Plástica" }
]
medicos_criados = medicos.map { |m| Medico.create!(m) }

pacientes = [
  { nome: "Britney Spears", cpf: "111.111.111-11", data_nascimento: "1981-12-02" },
  { nome: "Ariana Grande", cpf: "222.222.222-22", data_nascimento: "1993-06-26" },
  { nome: "Dua Lipa", cpf: "333.333.333-33", data_nascimento: "1995-08-22" },
  { nome: "Katy Perry", cpf: "444.444.444-44", data_nascimento: "1984-10-25" },
  { nome: "Miley Cyrus", cpf: "555.555.555-55", data_nascimento: "1992-11-23" },
  { nome: "Shrek", cpf: "666.666.666-66", data_nascimento: "2001-05-18" },
  { nome: "Princesa Fiona", cpf: "777.777.777-77", data_nascimento: "1990-01-01" },
  { nome: "Burro Falante", cpf: "888.888.888-88", data_nascimento: "2001-05-18" },
  { nome: "Gato de Botas", cpf: "999.999.999-99", data_nascimento: "2004-05-15" },
  { nome: "Lord Farquaad", cpf: "101.101.101-01", data_nascimento: "1960-04-01" },
  { nome: "Bob Esponja", cpf: "121.121.121-21", data_nascimento: "1999-05-01" },
  { nome: "Patrick Estrela", cpf: "131.131.131-31", data_nascimento: "1999-05-01" },
  { nome: "Pernalonga", cpf: "141.141.141-41", data_nascimento: "1940-07-27" },
  { nome: "Patolino", cpf: "151.151.151-51", data_nascimento: "1937-04-17" },
  { nome: "Homer Simpson", cpf: "161.161.161-61", data_nascimento: "1956-05-12" },
  { nome: "Marge Simpson", cpf: "171.171.171-71", data_nascimento: "1956-10-01" },
  { nome: "Scooby-Doo", cpf: "181.181.181-81", data_nascimento: "1969-09-13" },
  { nome: "Salsicha Rogers", cpf: "191.191.191-91", data_nascimento: "1969-09-13" },
  { nome: "Mickey Mouse", cpf: "202.202.202-02", data_nascimento: "1928-11-18" },
  { nome: "Peppa Pig", cpf: "212.212.212-12", data_nascimento: "2004-05-31" }
]
pacientes_criados = pacientes.map { |p| Paciente.create!(p) }

10.times do |i|
  Consulta.create!(
    medico: medicos_criados.sample,
    paciente: pacientes_criados.sample,
    data_hora: DateTime.now + i.days,
    observacoes: "Paciente reclamando de dores de cabeça frequentes. Recomendado exames de imagem e acompanhamento neurológico."
  )
end
