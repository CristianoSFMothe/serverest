*** Settings ***

Documentation        Suite de testes de cadastrar usuários

Resource            ../resources/Base.resource

Test Setup            Start Browser
Test Teardown         Finish Browser

*** Test Cases ***
Cenário: 01 - Realizar login com conta de administrador
    [Documentation]    login com usuário de perfil administrativo
    [Tags]             add_user

    ${user}    Get JSON    User
    
    Given I log in as an administrator        ${user}[admin][email]    ${user}[admin][password] 
    And I click the Login button
    And I click the "Register" button on the user card     Cadastrar Usuários   
    And I should see the page title                        Cadastro de usuários
    And I fill in the user details without selecting the administrator option
    ...                                                   ${user}[create_user][name]
    ...                                                   ${user}[create_user][email]
    ...                                                   ${user}[create_user][password]
    When I click the "Register" button
    Then I should see the user screen        Lista dos usuários    ${user}[create_user][email]
    Sleep    3
    

    

   