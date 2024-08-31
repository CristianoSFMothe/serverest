*** Settings ***

Documentation        Arquivo de keywords da tela principal

Resource             ../Base.resource

*** Keywords ***
E sou redirecionado para tela principal
    [Arguments]        ${name}

    Wait For Elements State    css=h1 >> text=${name}   visible    5   