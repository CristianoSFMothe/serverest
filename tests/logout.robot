*** Settings ***

Documentation        Suite de testes de login

Resource            ../resources/Base.resource

Test Setup            Start Browser
Test Teardown         Finish Browser

*** Test Cases ***
Cenário 01: Criar conta como administrador

    ${user}    Get JSON    User

    Dado cliquei no botão Cadastre-se
    E prencha o campo nome            ${user}[admin][name]
    E prencha o campo email           ${user}[admin][email]
    E prencha o campo password        ${user}[admin][password]
    E marque como administrador
    Quando clicar no botão entrar
    Então exibir a mensagem                    Cadastro realizado com sucesso
    E sou redirecionado para tela principal    Bem Vindo ${user}[admin][name]
  
