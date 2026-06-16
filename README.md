# 🏥 Sistema de Clínica Médica

Sistema de gestão para clínicas médicas desenvolvido como Trabalho Final para a disciplina de **Programação WEB - Ruby on Rails**. O sistema permite o controle completo (CRUD) de Médicos, Pacientes e o agendamento de Consultas, garantindo segurança, paginação e exportação de relatórios.

### 🎓 Informações Acadêmicas
* **Instituição:** UESPI - Universidade Estadual do Piauí
* **Centro:** CTU - Centro de Tecnologia e Urbanismo
* **Disciplina:** Programação WEB - Ruby on Rails
* **Professor:** Dr. Constantino Augusto Dias Neto
* **Desenvolvedores:** Kevin Tiago e Francisco Guilherme

---

## ✨ Funcionalidades e Requisitos Atendidos

O projeto foi construído atendendo a todas as especificações do documento base do trabalho:

* **Autenticação de Usuários (`Devise`):** Sistema seguro onde apenas usuários logados têm acesso às rotas e módulos da clínica.
* **Paginação (`Kaminari`):** Listagens otimizadas com quebra de páginas (5 registros por tela) para melhor performance e usabilidade.
* **Layout Profissional (`Twitter Bootstrap`):** Interface moderna, responsiva e padronizada utilizando o framework Bootstrap configurado localmente via Dart Sass.
* **Exportação em PDF (`Prawn`):** Geração dinâmica de relatórios em PDF das consultas agendadas, construídos do zero via código.
* **Geração de CSV:** Exportação de dados estruturados diretamente da tela principal para uso em planilhas externas.
* **Associações e Validações:** Banco de dados protegido contra entradas inválidas e com integridade referencial garantida entre as entidades (`Paciente`, `Médico` e `Consulta`).
* **Sistema de Busca:** Filtros de pesquisa em tempo real implementados nas listagens de todos os módulos.

---

## 🚀 Como executar o projeto

Para facilitar a avaliação, o projeto conta com scripts de automação que verificam as dependências, instalam as *gems*, preparam o banco de dados e compilam o CSS automaticamente.

### Pré-requisitos
Certifique-se de ter instalado em sua máquina:
* Ruby (versão compatível com Rails 7+)
* Node.js e npm
* Yarn e SQLite3
