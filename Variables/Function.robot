*** Settings ***
Library           Collections
Library           String
Library           Selenium2Library
Resource          ../Variables/MainVariable.robot

*** Keywords ***
Launch Browser
    [Arguments]  ${BROWSER}  ${Url}
    Open Browser    ${Url}    ${BROWSER}    alias=Main
    maximize browser window

Wait For Element
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait Until Keyword Succeeds    ${timeout}    ${interval}    Page Should Contain Element    ${element}

Wait And Click Element
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    Click Element    ${element}

Wait And Send Text
    [Arguments]    ${element}    ${text}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    Input Text    ${element}    ${text}

Focus Element
    [Arguments]    ${element}
    Set Focus To Element    ${element}

Wait And Focus Element
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    focus element    ${element}

Scroll To Element
    [Arguments]    ${element}
    Wait For Element    ${element}
    Scroll Element Into View    ${element}

Wait Element And Get Text
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    ${text}=  Get Text    ${element}
    [Return]   ${text}

Wait Element And Get Value
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    Get Value    ${element}

Check Element Text
    [Arguments]   ${element}  ${expectedText}  ${checkMessage}   ${timeout}=30s
    Wait For Element  ${element}  ${timeout}
    Sleep  1s
    ${expectedText}=  convert to string  ${expectedText}
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Text Should Be    ${element}    ${expectedText}
    Run Keyword If    '${status}'=='PASS'    log to console    \n${checkMessage} Success
    ...    ELSE    Fail    \nERROR-${checkMessage}-ERROR

When Test Fail Take Screenshot
    Sleep  1s
    Run Keyword And Ignore Error   Make Pptx    ${CURDIR}/../Tests/testresults/${TEST_NAME}
    Run Keyword If Test Failed    Capture Page Screenshot
    Run Keyword If Test Failed    Close Browser
    Run Keyword If Test Passed    Close Browser
    Close Browser
