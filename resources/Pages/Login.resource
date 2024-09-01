*** Settings ***
Documentation        Arquivo de keywords da tela de login

Resource             ../Base.resource

*** Keywords ***

Given I am on the login screen

    Wait For Elements State   ${TITLE}    visible    5 

And fill in the credentials
    [Arguments]    ${email}    ${password}

    ${user}    Get JSON    User

    Create User Admin    ${user}[admin][name]    ${user}[admin][name]    ${user}[admin][name]
    
    Fill Text    ${INPUT_EMAIL}    ${email}
    
    Fill Text    ${INPUT_PASSWORD}    ${password}

When I click the "Login" button

    ${user}    Get JSON    User

    Click    ${BTN_LOGIN}

    Find User By Email    ${user}[admin][name]

    Sleep    3
    
    Detete User By Id 



