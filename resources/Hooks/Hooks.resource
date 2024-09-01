*** Settings ***

Documentation        Arquivos de keywords em comum na aplicação

Library              JSONLibrary
Library              Collections
Library              RequestsLibrary

Resource            ../Base.resource   

*** Variables ***
${BASE_URL}        https://front.serverest.dev/login
${BROWSER}         chromium
${IS_HEADLESS}     True

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

Create User Admin

    ${user}    Get JSON    User
    
    ${payload}=    Create Dictionary
    ...    nome=${user}[admin][name] 
    ...    email=${user}[admin][email] 
    ...    password=${user}[admin][password] 
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

    [Return]    ${response}

    
Detete User By Id  

    ${response}        DELETE    url=${API_URL}/usuarios/${_id}
    ...                headers=&{HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    [Return]    ${response}

Find User By Email
    ${user}    Get JSON    User

    Create Session    alias=serverest    url=${API_URL}/    headers=${HEADERS}

    ${params}=    Create Dictionary    email=${user}[admin][email]

    ${response}=    GET On Session    alias=serverest    url=usuarios    params=${params}
    ...    expected_status=200    msg=Usuário não encontrado
    
    Set Test Variable    ${_id}    ${response.json()['usuarios'][0]['_id']}

    Log     _id: ${_id}    

    [Return]    ${response.text}
