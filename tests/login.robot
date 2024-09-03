*** Settings ***

Documentation        Suite de testes de login

Resource            ../resources/Base.resource

Test Setup            Start Browser
Test Teardown         Finish Browser

*** Test Cases ***
Cenário: 01 - Realizar login com conta de administrador
    [Documentation]    login com usuário de perfil administrativo
    [Tags]             admin    

    ${user}    Get JSON    User

    Given I am on the login screen
    And fill in the credentials                  ${user}[admin][name]     
    ...                                          ${user}[admin][email]    
    ...                                          ${user}[admin][password]   
    When I click the "Login" button 
    Then I am redirected to the main screen      Bem Vindo ${user}[admin][name]

Cenário: 02 - Tentar realizar login com e-mail incorredo
    [Documentation]    login com usuário de perfil administrativo
    [Tags]             invalid_email    

    ${user}    Get JSON    User

    Given I am on the login screen
    And fill in the invalid credentials           ${user}[invalid_email][email]     
    ...                                           ${user}[invalid_email][password]                     
    When I click the "Login" button 
    Then it should display the alert message      Email e/ou senha inválidos
    
Cenário: 03 - Tentar realizar login com senha incorredo
    [Documentation]    login com usuário de perfil administrativo
    [Tags]             invalid_password    

    ${user}    Get JSON    User

    Given I am on the login screen
    And fill in the invalid credentials           ${user}[invalid_password][email]     
    ...                                           ${user}[invalid_password][password]                     
    When I click the "Login" button 
    Then it should display the alert message      Email e/ou senha inválidos

Cenário: 03 - Tentar realizar login com e-mail em branco
    [Documentation]    login com usuário de perfil administrativo
    [Tags]             email_empty   

    ${user}    Get JSON    User

    Given I am on the login screen
    And fill in the invalid credentials           ${EMPTY}    ${user}[invalid_password][password]                     
    When I click the "Login" button 
    Then it should display the alert message      email é obrigatório

Cenário: 04 - Tentar realizar login com senha em branco
    [Documentation]    login com usuário de perfil administrativo
    [Tags]             password_empty   

    ${user}    Get JSON    User

    Given I am on the login screen
    And fill in the invalid credentials           ${user}[invalid_password][email]    ${EMPTY}                  
    When I click the "Login" button 
    Then it should display the alert message      password é obrigatório