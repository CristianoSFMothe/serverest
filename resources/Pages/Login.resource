*** Settings ***

Documentation        Arquivo de keywords da tela de login

Resource             ../Base.resource

*** Keywords ***

Dado que esteja na tela de login
    
    Wait For Elements State   ${TITLE}    visible    5 

E prencha o campo email 
    [Arguments]    ${email}
    
    Fill Text    ${INPUT_EMAIL}    ${email}

E prencha o campo password
    [Arguments]    ${password}
    
    Fill Text    ${INPUT_PASSWORD}    ${password}

Quando clicar no botão entrar

    Click    ${BTN_REGISTER}
