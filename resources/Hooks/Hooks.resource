*** Settings ***

Documentation        Arquivos de keywords em comum na aplicação

Library              JSONLibrary

Resource            ../Base.resource   

*** Variables ***
${BASE_URL}        https://front.serverest.dev/login
${BROWSER}         chromium
${IS_HEADLESS}     False

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
