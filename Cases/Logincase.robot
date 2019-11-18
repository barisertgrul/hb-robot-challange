*** Settings ***
Library           Selenium2Library
Resource          ../Variables/Function.robot
Resource          ../Variables/LoginVariable.robot


*** Keywords ***
Login
    Open Login Page
    Enter Email
    Enter Password
    Click Login Button

Open Login Page
    Wait And Click Element      ${myAccount}
    Wait Until Element Is Visible       ${loginLink}
    Wait And Click Element  ${loginLink}

Enter Email
    Wait And Send Text  ${emailInput}   ${userMail}

Enter Password
    Wait And Send Text  ${passwordInput}   ${password}

Click Login Button
    Wait And Click Element  ${loginButton}

