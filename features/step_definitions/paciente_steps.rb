When('eu clico em remover o paciente com cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
  click_button 'Destroy this paciente'
end

Then('eu vejo uma mensagem que o paciente foi apagado com sucesso') do
  expect(page).to have_content('Paciente was successfully destroyed')
end

Given('estou na pagina de paciente') do
  visit('pacientes/new')
  expect(page).to have_content('New paciente')
end

When('eu preencho os campos de nome {string}, cpf {string}, email {string}, data de nascimento {string}') do |nome, cpf, email, data_nascimento|
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[data_nascimento]', :with => data_nascimento
  fill_in 'Cep',	with: '12345-123'
  fill_in 'Cidade', with: 'Garanhuns'
  fill_in 'Bairro', with: 'Boa vista'
  fill_in 'Logradouro', with: 'Praca jose'
  fill_in 'Complemento', with: 'teste'
end

When('eu clico em cadastrar novo paciente') do
  click_button 'Create Paciente'
end

Then('eu vejo uma mensagem que o paciente foi cadastrado com sucesso') do
  expect(page).to have_content('Paciente was successfully created.')
end
