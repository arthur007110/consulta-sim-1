Given('o paciente com o cpf {string} existe') do |cpf|
  visit 'pacientes/new'
  expect(page).to have_content('New paciente')

  fill_in 'paciente[nome]', :with => 'Arthur Costa'
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => 'arthur@email.com'
  fill_in 'paciente[data_nascimento]', :with => '2000-01-01'
  fill_in 'Cep',	with: '12345-123'
  fill_in 'Cidade', with: 'Garanhuns'
  fill_in 'Bairro', with: 'Boa vista'
  fill_in 'Logradouro', with: 'Praca jose'
  fill_in 'Complemento', with: 'teste'
  click_button 'Create Paciente'

  expect(page).to have_content(cpf)
end

Given('estou na pagina de consulta') do
  visit 'consultas/new'
end

When('eu preencho os campos com horario {string}, data {string}, medico {string}, paciente {string}') do |horario, data, medico, paciente|
  fill_in 'consulta[data]', :with => data
  select horario, from:'consulta_horario'
  select paciente, from: 'consulta_paciente_id'
  select medico, from: 'consulta_medico_id'
end

When('eu clico em criar consulta') do
  click_button 'Create Consulta'
end

Then('eu vejo uma mensagem que a consulta foi cadastrada com sucesso') do
  expect(page).to have_content('Consulta was successfully created.')
end

Given('a consulta para o dia {string} as {string} medico {string} e paciente {string} existe') do |data, horario, medico, paciente|
  visit('consultas/new')
  fill_in 'consulta[data]', :with => data
  select horario, from:'consulta_horario'
  select paciente, from: 'consulta_paciente_id'
  select medico, from: 'consulta_medico_id'
  click_button 'Create Consulta'

  expect(page).to have_content('Consulta was successfully created.')
end

Given('estou na pagina de consultas') do
  visit('consultas')
end

Then('eu consigo visualizar a consulta para o dia {string} as {string} medico {string} e paciente {string}') do |data, horario, paciente, medico|
  expect(page).to have_content(data)
  expect(page).to have_content(horario)
  expect(page).to have_content(paciente)
  expect(page).to have_content(medico)
end
