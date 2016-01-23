*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         twitter.com
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     AutomationStuf1
${VALID PASSWORD}   Abcd123
${LOGIN URL}      https://${SERVER}
${WELCOME URL}    https://${SERVER}/
${ERROR URL}      https://${SERVER}/login/error

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Welcome to Twitter - Login or Sign up

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    signin-email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    signin-password    ${password}

Submit Credentials
    Click Button    xpath=//*[@id="front-container"]/div[2]/div[2]/form/table/tbody/tr/td[2]/button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Twitter
