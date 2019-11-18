*** Settings ***
Suite Setup
Test Setup        Launch Browser  ${BROWSER}  ${url}
Resource          ../Variables/Function.robot
Resource          ../Cases/Logincase.robot
Resource          ../Cases/Homescreen.robot
Resource          ../Cases/Search.robot
Resource          ../Cases/AddProduct.robot
Library           Selenium2Library

*** Variables ***
${BROWSER}=   Chrome

*** Test Cases ***
Login And Add Cart
    Login
    Select Product
    Add To Cart
    Go To Cart
    Checkout
    Close Browser


Search Product And Filter
    Search Item
    Filter And Select Brand
    Select Price Range
    Select Color Black
    Click First Result Of Search
    Check Product Reviews
    Click Yes Fist Avaliable Review
    Close Browser
*** Keywords ***
