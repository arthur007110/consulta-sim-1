require "test_helper"

class ConsultaTest < ActiveSupport::TestCase
  test 'criando consulta no passado' do
    medico = Medico.new(
      nome: 'Eva dos santos',
      cpf: '876.575.640-16',
      email: 'eva@email.com',
      crm: '123456',
      especialidade: 'Psicologa'
    )
    assert medico.save

    paciente = Paciente.new(
      nome: 'Arthur Costa',
      data_nascimento: '2000-01-18',
      cpf: '876.575.640-16',
      email: 'arthur@email.com'
    )

    endereco = Endereco.new(
      cep: '12345-123',
      cidade: 'Garanhuns',
      bairro: 'Boa vista',
      logradouro: 'Praca jose',
      complemento: 'teste'
    )
    paciente.endereco = endereco
    assert paciente.save

    consulta = Consulta.new(
      data: '2020-10-22',
      horario: '11:00',
      medico_id: medico.id,
      paciente_id: paciente.id
    )

    assert_not consulta.save
  end

  test 'criando consulta com horario invalido' do
    medico = Medico.new(
      nome: 'Eva dos santos',
      cpf: '876.575.640-16',
      email: 'eva@email.com',
      crm: '123456',
      especialidade: 'Psicologa'
    )
    assert medico.save

    paciente = Paciente.new(
      nome: 'Arthur Costa',
      data_nascimento: '2000-01-18',
      cpf: '876.575.640-16',
      email: 'arthur@email.com'
    )

    endereco = Endereco.new(
      cep: '12345-123',
      cidade: 'Garanhuns',
      bairro: 'Boa vista',
      logradouro: 'Praca jose',
      complemento: 'teste'
    )
    paciente.endereco = endereco
    assert paciente.save

    consulta = Consulta.new(
      data: '9000-10-22',
      horario: '12:00',
      medico_id: medico.id,
      paciente_id: paciente.id
    )

    assert_not consulta.save
  end
end
