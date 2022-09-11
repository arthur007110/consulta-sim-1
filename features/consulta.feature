Feature: Consulta
  As a usuario do sistema
  I want to criar, visualizar consultas
  So that eu nao tenha que fazer isso de forma manual ou presencial

  Scenario: criar consulta
    Given o paciente com o cpf '876.575.640-16' existe
    And estou na pagina de medico
    And o medico com CRM '11223' existe
    And estou na pagina de consulta
    When eu preencho os campos com horario '11:00', data '9000-10-10', medico 'Rodrigo Andrade', paciente 'Arthur Costa'
    And eu clico em criar consulta
    Then eu vejo uma mensagem que a consulta foi cadastrada com sucesso

  Scenario: visualizar consulta
    Given o paciente com o cpf '876.575.640-16' existe
    And estou na pagina de medico
    And o medico com CRM '11223' existe
    And a consulta para o dia '9000-10-10' as '11:00' medico 'Rodrigo Andrade' e paciente 'Arthur Costa' existe
    And estou na pagina de consultas
    Then eu consigo visualizar a consulta para o dia '9000-10-10' as '11:00' medico 'Rodrigo Andrade' e paciente 'Arthur Costa'