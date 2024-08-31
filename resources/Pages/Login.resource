*** Settings ***
Documentation        Arquivo de keywords da tela de login

Resource             ../Base.resource

*** Keywords ***

Given I am on the login screen

    Wait For Elements State   ${TITLE}    visible    5 

And I fill in the email field 
    [Arguments]    ${email}
    
    Fill Text    ${INPUT_EMAIL}    ${email}

And I fill in the password field
    [Arguments]    ${password}
    
    Fill Text    ${INPUT_PASSWORD}    ${password}

When I click the "Login" button

    Click    ${BTN_LOGIN}


