*** Settings ***

Documentation        Arquivo de keywords da tela de criação de conta

Resource             ../Base.resource

*** Keywords ***
And I click the "Sign Up" button
    
    Click    ${LINK_REGISTER}    

And I fill in the name field 
    [Arguments]    ${name}
    
    Fill Text    ${INPUT_NAME}    ${name}

And I fill in the email field 
    [Arguments]    ${email}
    
    Fill Text    ${INPUT_EMAIL}    ${email}

And I fill in the password field
    [Arguments]    ${password}
    
    Fill Text    ${INPUT_PASSWORD}    ${password}

And I check the "Administrator" option    

    Check Checkbox    ${INPUT_ADMIN}    

When I click the "Register" button

    Click    ${BTN_REGISTER}

Then the message should be displayed
    [Arguments]        ${msg}
    [Timeout]          10s

    Wait For Elements State    css=a >> text=${msg}    visible    5

    Find User By Email

    Sleep    3
    
    Detete User By Id 


