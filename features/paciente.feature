Feature: Paciente
  As a paciente
  I want to adicionar, remover, visualizar e editar meu cadastro
  So that eu nao tenha que fazer isso de forma manual ou presencial

  Scenario: remover paciente
    Given o paciente com o cpf '876.575.640-16' existe
    When eu clico em remover o paciente com cpf '876.575.640-16'
    Then eu vejo uma mensagem que o paciente foi apagado com sucesso

  Scenario: cadastrar paciente
    Given estou na pagina de paciente
    When eu preencho os campos de nome 'Arthur Costa', cpf '876.575.640-16', email 'arthur@email.com', data de nascimento '2000-01-01'
    And eu clico em cadastrar novo paciente
    Then eu vejo uma mensagem que o paciente foi cadastrado com sucesso