*** Settings ***

Documentation        Arquivo de keywords da tela de criação de conta

Resource             ../Base.resource

*** Keywords ***
And I click the "Sign Up" button
    
    Click    ${LINK_REGISTER}    

And I fill in the name field 
    [Arguments]    ${name}
    
    Fill Text    ${INPUT_NAME}    ${name}

And I check the "Administrator" option    

    Check Checkbox    ${INPUT_ADMIN}    

When I click the "Register" button

    Click    ${BTN_REGISTER}

Then the message should be displayed
    [Arguments]        ${message}

    Wait For Elements State    css=a >> text=${message}    visible    5   
