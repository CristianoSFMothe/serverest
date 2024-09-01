*** Settings ***

Documentation        Suite de testes de login

Resource            ../resources/Base.resource

Test Setup            Start Browser
Test Teardown         Finish Browser

*** Test Cases ***
Cenário: 01 - Realizar login com conta de administrador
    [Documentation]        login com usuário de perfil administrador
    [Tags]                 admin

    ${user}    Get JSON    User

    Create User Profile Administrador      ${user}[admin][name]    
    ...                                    ${user}[admin][email]    
    ...                                    ${user}[admin][password]

    Given I am on the login screen
    And I fill in the email field              ${user}[admin][email]    
    And I fill in the password field           ${user}[admin][password]   
    When I click the "Login" button 
    And I am redirected to the main screen      Bem Vindo ${user}[admin][name]

Cenário: 02 - Realizar login com conta de usuário comum
    [Documentation]        login com usuário de perfil comum
    [Tags]                 common

    ${user}    Get JSON    User

    Create User Profile Common     ${user}[common][name]    
    ...                            ${user}[common][email]    
    ...                            ${user}[common][password]

    Given I am on the login screen
    And I fill in the email field              ${user}[common][email]    
    And I fill in the password field           ${user}[common][password]   
    When I click the "Login" button 
    And I am redirected to the main screen      Bem Vindo ${user}[common][name]