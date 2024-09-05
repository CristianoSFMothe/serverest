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
    [Arguments]        ${message}
    
    ${user}    Get JSON    User

    Wait For Elements State    css=a >> text=${message}    visible    5

    Find User By Email    ${user}[admin][email]    

    Sleep    3
    
    Detete User By Id 


Then it should display the alert message
    [Arguments]    @{messages}
    FOR    ${message}    IN    @{messages}
        Wait For Elements State    css=span >> text=${message}    visible    5
    END


And I click the "Register" button on the user card
    [Arguments]    ${card_name}

    Wait For Elements State    css=h5 >> text=${card_name}    visible    5

    Click button    cadastrarUsuarios    Cadastrar

And I fill in the user details without selecting the administrator option
    [Arguments]    ${name}    ${email}    ${password}

    Fill Text    ${INPUT_NAME}        ${name}
    Fill Text    ${INPUT_EMAIL}       ${email}
    Fill Text    ${INPUT_PASSWORD}    ${password}

Then I should see the user screen
    [Arguments]    ${expected_text}    ${email_user}

    ${user}    Get JSON    User

    Wait For Elements State    css=h1 >> text=${expected_text}
    Wait For Elements State    css=td >> text=${email_user}

    Find User By Email    ${user}[admin][email]
    
    Detete User By Id 

    Find User By Email    ${user}[create_user][email]
    
    Detete User By Id 



