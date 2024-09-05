*** Settings ***

Documentation        Arquivos de keywords em comum na aplicação

Library              JSONLibrary
Library              Collections
Library              RequestsLibrary

Resource            ../Base.resource   

*** Variables ***
${BASE_URL}        https://front.serverest.dev/login
${BROWSER}         chromium
${IS_HEADLESS}     False

${API_URL}         https://serverest.dev
&{HEADERS}         Content-Type=application/json
${_id}

*** Keywords ***
Start Browser
    New Browser    browser=${BROWSER}    headless=${IS_HEADLESS}    
    New Page       ${BASE_URL}

Finish Browser
    Take Screenshot        fullPage=true

Get JSON

    [Arguments]    ${json_path}

    ${json}    Load Json From File    
    ...        ${EXECDIR}/resources/Json/${json_path}.json
    ...        encoding=UTF-8
    
    Return From Keyword    ${json}

Given I log in as an administrator
    [Arguments]    ${email}    ${password}

    ${user}    Get JSON    User

    Create User Admin    ${user}[admin][name]     
    ...                  ${user}[admin][email]    
    ...                  ${user}[admin][password]
    
    Fill Text    ${INPUT_EMAIL}       ${email}
    
    Fill Text    ${INPUT_PASSWORD}    ${password}

And I click the Login button

    Click    ${BTN_LOGIN}
    
Click button
    [Arguments]    ${card_name}    ${btn_text}

    ${btn_text}    Set Variable
    ...            css=[data-testid='${card_name}'] >> text=${btn_text}
    
    Click    ${btn_text}

And I should see the page title
    [Arguments]    ${expected_text}

    Wait For Elements State    css=h1 >> text=${expected_text}

Create User Admin
    [Arguments]    ${name}    ${email}    ${password}    
    
    ${payload}=    Create Dictionary
    ...    nome=${name}
    ...    email=${email}
    ...    password=${password}
    ...    administrador=true

    ${response}=    POST    ${API_URL}/usuarios
    ...    json=${payload}
    ...    headers=${HEADERS}
    ...    expected_status=201

    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Should Be Equal As Strings    ${message}    Cadastro realizado com sucesso
    Set Suite Variable      ${message}

    Set Test Variable    ${_id}  ${response["_id"]}

    Log    User created with ID: ${_id}

    RETURN    ${response}

    
Detete User By Id  

    ${response}        DELETE    url=${API_URL}/usuarios/${_id}
    ...                headers=&{HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    RETURN    ${response}

Find User By Email
    [Arguments]    ${email}  

    Create Session    alias=serverest    url=${API_URL}/    headers=${HEADERS}

    ${params}=    Create Dictionary    email=${email}

    ${response}=    GET On Session    alias=serverest    url=usuarios    params=${params}
    ...    expected_status=200    msg=Usuário não encontrado
    
    Set Test Variable    ${_id}    ${response.json()['usuarios'][0]['_id']}

    Log     _id: ${_id}    

    RETURN    ${response}