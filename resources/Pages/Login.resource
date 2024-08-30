*** Settings ***

Documentation        Arquivo de keywords da tela de criação de conta

Resource             ../Base.resource

***keywords***

Dado que estou na tela de login
    
    Wait For Elements State    ${TXT_LOGIN}    visible    5

E preencha as credenciais
    [Arguments]    ${email}    ${password}

   Fill Text    ${INPUT_EMAIL}       ${email}
   Fill Text    ${INPUT_PASSWORD}    ${password}

Quando clicar no botão "Entrar"

    Click    ${BTN_LOGIN} 

E sou redirecionado para tela principal
    [Arguments]        ${name}

    Wait For Elements State    css=h1 >> text=${name}   visible    5