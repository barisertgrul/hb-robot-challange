*** Settings ***
Library           Selenium2Library
Resource          ../Variables/Function.robot
Resource          ../Variables/ProductVariable.robot


*** Keywords ***
Add To Cart
    Wait And Click Element    ${addToCart}

Go To Cart
    Wait And Click Element    ${goToCart}

Checkout
    Wait And Click Element  ${Checkout}

Product Reviews Tabs
    Wait And Click Element  ${productReviewsTab}

Check Product Reviews
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Text Should Be   ${productReviewsTab}  Yorumlar (0)
    Run Keyword If    '${status}'=='PASS'    Pass Execution   Product hasn't Reviews
    ...    ELSE    Product Reviews Tabs

Click Yes Fist Avaliable Review
    Scroll To Element  ${reviewsYesButton}
    Wait And Click Element  ${reviewsYesButton}
    Check Review Message

Check Review Message
    Check Element Text  ${reviewMessageLocator}   ${reviewMessage}   Scenario 2