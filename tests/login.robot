*** Settings ***

Documentation        Suite de testes de login

Resource            ../resources/Base.resource

Test Setup            Start Browser
Test Teardown         Finish Browser

*** Test Cases ***
Cenário: 01 - Realizar login com conta de administrador

    ${user}    Get JSON    User

    Dado que estou na tela de login
    E preencha as credenciais                  ${user}[admin][email]    ${user}[admin][password]   
    Quando clicar no botão "Entrar" 
    E sou redirecionado para tela principal    Bem Vindo ${user}[admin][name]
