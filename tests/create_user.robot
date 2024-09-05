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
    And I fill in the email field             ${user}[user][email]
    And I fill in the password field          ${user}[user][password]
    When I click the "Register" button
    Then you should see the home page         Serverest Store

Cenário: 03 - Tentiva de criar conta como usuário nome em branco
    [Documentation]    cadastrar sem preencher o campo nome
    [Tags]             name_empty
    
    ${user}    Get JSON    User

    Given I am on the login screen
    And I click the "Sign Up" button
    And I fill in the name field                ${EMPTY}
    And I fill in the email field               ${user}[user][email]
    And I fill in the password field            ${user}[user][password]
    When I click the "Register" button
    Then it should display the alert message    Nome é obrigatório    

Cenário: 04 - Tentiva de criar conta como usuário e-mail em branco
    [Documentation]    cadastrar sem preencher o campo e-mail
    [Tags]             email_empty
    
    ${user}    Get JSON    User

    Given I am on the login screen
    And I click the "Sign Up" button
    And I fill in the name field                    ${user}[user][name]
    And I fill in the email field                   ${EMPTY}
    And I fill in the password field                ${user}[user][password]
    When I click the "Register" button
    Then it should display the alert message        Email é obrigatório

Cenário: 05 - Tentiva de criar conta como usuário senha em branco
    [Documentation]    cadastrar sem preencher o campo senha
    [Tags]             pass_empty
    
    ${user}    Get JSON    User

    Given I am on the login screen
    And I click the "Sign Up" button
    And I fill in the name field                    ${user}[user][name]
    And I fill in the email field                   ${user}[user][email]
    And I fill in the password field                ${EMPTY}
    When I click the "Register" button
    Then it should display the alert message        Password é obrigatório

Cenário: 06 - Tentiva de criar conta como usuário todos os campos em branco
    [Documentation]    cadastrar sem preencher todos os campo em branco
    [Tags]             all_empty
    
    ${user}    Get JSON    User

    Given I am on the login screen
    And I click the "Sign Up" button
    And I fill in the name field                    ${EMPTY}
    And I fill in the email field                   ${EMPTY}
    And I fill in the password field                ${EMPTY}
    When I click the "Register" button
    Then it should display the alert message         Email é obrigatório    
    ...                                              Nome é obrigatório    
    ...                                              Password é obrigatório
