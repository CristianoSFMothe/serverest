*** Settings ***

Documentation        Arquivo de keywords da tela principal

Resource             ../Base.resource

*** Keywords ***
And I am redirected to the main screen
    [Arguments]        ${name}

    Wait For Elements State    css=h1 >> text=${name}   visible    5   


Then you should see the home page
    [Arguments]    ${expected_text}

    Wait For Elements State    css=h1 >> text=${expected_text}   visible    5    
