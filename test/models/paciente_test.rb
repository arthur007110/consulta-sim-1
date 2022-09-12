require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test 'Criar paciente com email invalido' do
    paciente = Paciente.new(
      nome: 'Arthur Costa',
      data_nascimento: '2000-01-18',
      cpf: '876.575.640-16',
      email: 'arthuremail.com'
    )

    endereco = Endereco.new(
      cep: '12345-123',
      cidade: 'Garanhuns',
      bairro: 'Boa vista',
      logradouro: 'Praca jose',
      complemento: 'teste'
    )
    paciente.endereco = endereco
    assert_not paciente.save
  end

  test 'Criar paciente com data_nascimento invalida' do
    paciente = Paciente.new(
      nome: 'Arthur Costa',
      data_nascimento: '9000-01-18',
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
    assert_not paciente.save
  end
end
