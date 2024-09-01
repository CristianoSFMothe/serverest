*** Settings ***

Documentation        Suite de testes de criação de conta

Resource            ../resources/Base.resource

Test Setup            Start Browser
Test Teardown         Finish Browser

*** Test Cases ***
Cenário: 01 - Criar conta como administrador
    [Documentation]    teste para cadastrar usuário perfil administrador
    [Tags]             admin

    ${user}    Get JSON    User

    Given I am on the login screen
    And I click the "Sign Up" button
    And I fill in the name field              ${user}[admin][name]
    And I fill in the email field             ${user}[admin][email]
    And I fill in the password field          ${user}[admin][password]
    And I check the "Administrator" option
    When I click the "Register" button
    Then the message should be displayed      Cadastro realizado com sucesso
    And I am redirected to the main screen    Bem Vindo ${user}[admin][name] 

Cenário: 02 - Criar conta como usuário comum
    [Documentation]    teste para cadastrar usuário perfil comum
    [Tags]             user
    
    ${user}    Get JSON    User

    Given I am on the login screen
    And I click the "Sign Up" button
    And I fill in the name field              ${user}[user][name]
    Sleep    1
    And I fill in the email field             ${user}[user][email]
    Sleep    1
    And I fill in the password field          ${user}[user][password]
    Sleep    1
    When I click the "Register" button
    Sleep    1
    Then you should see the home page         Serverest Store

    Sleep    3
