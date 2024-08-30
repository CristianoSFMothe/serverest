*** Settings ***

Documentation        Arquivo de keywords da tela de criação de conta

Resource             ../Base.resource

*** Keywords ***

Dado cliquei no botão Cadastre-se
    
    Click    ${LINK_REGISTER}    

E prencha o campo nome 
    [Arguments]    ${name}
    
    Fill Text    ${INPUT_NAME}    ${name}

E prencha o campo email 
    [Arguments]    ${email}
    
    Fill Text    ${INPUT_EMAIL}    ${email}

E prencha o campo password
    [Arguments]    ${password}
    
    Fill Text    ${INPUT_PASSWORD}    ${password}

E marque como administrador

    Check Checkbox    ${INPUT_ADMIN}    

Quando clicar no botão entrar

    Click    ${BTN_REGISTER}

Então exibir a mensagem
    [Arguments]        ${msg}

    Wait For Elements State    css=a >> text=${msg}    visible    5

E sou redirecionado para tela principal
    [Arguments]        ${name}

    Wait For Elements State    css=h1 >> text=${name}   visible    5   


  