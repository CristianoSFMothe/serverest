*** Settings ***

Documentation        Arquivo de keywords da tela principal

Resource             ../Base.resource

*** Keywords ***
And I am redirected to the main screen
    [Arguments]        ${name}

    Wait For Elements State    css=h1 >> text=${name}   visible    5   