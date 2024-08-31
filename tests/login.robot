*** Settings ***

Documentation        Suite de testes de login

Resource            ../resources/Base.resource

Test Setup            Start Browser
Test Teardown         Finish Browser

*** Test Cases ***
Cenário: 01 - Realizar login com conta de administrador

    ${user}    Get JSON    User

    Given I am on the login screen
    And I fill in the email field                  ${user}[admin][email]    
    And I fill in the password field               ${user}[admin][password]   
    When I click the "Login" button 
    And I am redirected to the main screen         Bem Vindo ${user}[admin][name]