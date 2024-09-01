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
    Then display the welcome message           Bem Vindo ${user}[admin][name]

    Find User By Email    ${user}[admin][email]    

    Sleep    3
    
    Detete User By Id 

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
    Then you should see the home page          Serverest Store

    Find User By Email    ${user}[common][email]    

    Sleep    3
    
    Detete User By Id 


Cenário: 03 - Tentar realizar login com e-mail incorreto
    [Documentation]        tentativa de login informando o e-mail incorreto
    [Tags]                 incorrect_email

    ${user}    Get JSON    User

    Create User Profile Common     ${user}[common][name]    
    ...                            ${user}[common][email]    
    ...                            ${user}[common][password]

    Given I am on the login screen
    And I fill in the email field                ${user}[incorrect_email][email]    
    And I fill in the password field             ${user}[common][password]   
    When I click the "Login" button  
    Then it should display the alert message      Email e/ou senha inválidos

    Find User By Email    ${user}[common][email]    

    Sleep    3
    
    Detete User By Id 

Cenário: 04 - Tentar realizar login com semha incorreto
    [Documentation]        tentativa de login informando o e-mail incorreto
    [Tags]                 incorrect_password

    ${user}    Get JSON    User

    Create User Profile Common     ${user}[common][name]    
    ...                            ${user}[common][email]    
    ...                            ${user}[common][password]

    Given I am on the login screen
    And I fill in the email field                ${user}[common][email]    
    And I fill in the password field             ${user}[incorrect_password][password]   
    When I click the "Login" button 
    Then it should display the alert message      Email e/ou senha inválidos