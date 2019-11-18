*** Settings ***
Library           Selenium2Library
Resource          ../Variables/Function.robot
Resource          ../Variables/SearchVariable.robot


*** Keywords ***
Filter And Select Brand
    Wait And Send Text  ${brandInput}    ${brand}
    Wait And Click Element  ${brandLabel}

Select Price Range
    Wait And Click ELement  ${priceRange}

Select Color Black
    Wait And Click Element  ${colorBlack}

Click First Result Of Search
    Wait And Click Element   ${selectFirstProduct}
