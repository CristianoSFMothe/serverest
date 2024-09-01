*** Settings ***
Documentation        Arquivo de keywords da tela de login

Resource             ../Base.resource

*** Keywords ***

Given I am on the login screen

    Wait For Elements State   ${TITLE}    visible    5 

And fill in the credentials
    [Arguments]    ${name}    ${email}    ${password}    
    
    Fill Text    ${INPUT_EMAIL}    ${email}
    
    Fill Text    ${INPUT_PASSWORD}    ${password}

When I click the "Login" button

    ${user}    Get JSON    User

    Click    ${BTN_LOGIN}   

Then display the welcome message
    [Arguments]        ${name}

    Wait For Elements State    css=h1 >> text=${name}   visible    5  
    