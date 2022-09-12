require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'criando medico corretamente' do
    medico = Medico.new nome: 'Rodrigo Andrade', cpf: '706.508.980-01', email: 'rodrigo@rodrigo.com',
                        especialidade: 'Reumatologista', crm: '123456'
    assert medico.save
  end

  test 'criando medico com nome invalido' do
    medico = Medico.new(
      nome: 'Eva',
      cpf: '876.575.640-16',
      email: 'eva@email.com',
      crm: '123456',
      especialidade: 'Psicologa'
    )
    assert_not medico.save
  end

  test 'criando medico com especialidade invalida' do
    medico = Medico.new(
      nome: 'Eva dos Santos',
      cpf: '876.575.640-16',
      email: 'eva@email.com',
      crm: '123456',
      especialidade: 'Psi'
    )
    assert_not medico.save
  end
end
