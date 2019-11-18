*** Settings ***
Library           Selenium2Library
Resource          ../Variables/Function.robot
Resource          ../Variables/HomepageVariable.robot


*** Keywords ***
Select Product
    Scroll To Element  ${product}
    Wait And Click Element    ${product}

Search Item
    Wait And Send Text  ${searchInput}  ${searchData}
    Wait And Click Element  ${searchButton}
