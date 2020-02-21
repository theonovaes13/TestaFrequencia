require 'rails_helper'

RSpec.feature "sign in", :type => :feature do
  let(:user){ create :user, :admin}
  let(:materia){ build :subject }
  let(:professor){ create :user, :professor }

  scenario 'usuario entra na home' do
    visit '/'
    expect(page).to have_text "Login"
  end

  scenario 'usuario faz login' do
    visit '/'
    click_link 'Login'
    fill_in "Login", with: user.matricula
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_text "Bem-vindo(a)"
  end

  scenario 'usuario cria um user novo' do
    login_as(user)
    visit '/admin/user'
    expect(page).to have_text "List of Users"
    click_link 'Add new'
    fill_in "Nome", with: "jonson"
    fill_in "Email", with: "bronson@email.com"
    fill_in "Password", with: "321321"
    fill_in "Password confirmation", with: "321321"
    fill_in "Matricula", with: '123123'
    select 'professor', from: 'Status'
    click_button 'Save'
    visit '/admin/subject/new'
    select 'jonson', from: 'User'
    fill_in "Nome", with: materia.nome
    fill_in "Dias semana", with: materia.dias_semana
    fill_in "Hora inicio", with: materia.hora_inicio
    fill_in "Hora termino", with: materia.hora_termino
    fill_in "Capacidade", with: materia.capacidade
    click_button 'Save'
    expect(page).to have_text "Subject successfully created"

  end


end
