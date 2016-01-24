*** Settings ***
Documentation     A resource file for salesforce automation.
Library           Selenium2Library

*** Variables ***
${SERVER}             salesforce.com
${BROWSER}            Firefox
${SELENIUM DELAY}     0
${SELENIUM TIMEOUT}   15
${VALID USER}         nicolas.d.reymundo@gmail.com
${VALID PASSWORD}     Yj&&#q5JlH8nEv6jqZ5o
${LOGIN URL}          https://login.${SERVER}
${HOME URL}           https://na24.${SERVER}/
${ERROR URL}          https://login.${SERVER}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${SELENIUM DELAY}
    Set Selenium Timeout    ${SELENIUM TIMEOUT}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login | Salesforce

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Go To Home Page
    Go To    ${HOME URL}
    Wait Until Page Contains Element    userNavButton
    Title Should Be    Salesforce - Developer Edition

Input Username
  [Arguments]    ${username}
  Input Text    username    ${username}

Input Password
  [Arguments]    ${password}
  Input Text    password    ${password}

Submit Credentials
  Click Button    Login

Home Page Should Be Open
  Wait Until Page Contains Element    userNavButton
  Location Should Contain    ${HOME URL}
  Title Should Be    Force.com Home Page ~ Salesforce - Developer Edition

Validate Lead
  [Arguments]   ${First Name}   ${Last Name}    ${Company Name}
  Then Title Should Be        Lead: ${First Name} ${Last Name} ~ Salesforce - Developer Edition
  And Element Should Contain  lea2_ileinner     ${First Name} ${Last Name}
  And Element Should Contain  lea3_ileinner     ${Company Name}