*** Settings ***

Documentation        Suite de testes de criação de conta

Resource            ../resources/Base.resource

Test Setup            Start Browser
Test Teardown         Finish Browser

*** Test Cases ***
Cenário: 01 - Criar conta como administrador

    ${user}    Get JSON    User

    Dado que esteja na tela de login
    E clique no botão "Cadastre-se"
    E prencha o campo nome            ${user}[admin][name]
    E prencha o campo email           ${user}[admin][email]
    E prencha o campo password        ${user}[admin][password]
    E marque como administrador
    Quando clicar no botão "Cadastrar"
    Então exibir a mensagem                    Cadastro realizado com sucesso
    E sou redirecionado para tela principal    Bem Vindo ${user}[admin][name] 
