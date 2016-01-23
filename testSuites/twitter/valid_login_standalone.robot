*** Settings ***
Library           Selenium2Library

*** Variables ***
${SERVER}         twitter.com
${BROWSER}        Chrome
# Yes, there's a typo in the username, I know :D.
${VALID USER}     AutomationStuf1
${VALID PASSWORD}   Abcd123
${LOGIN URL}      https://${SERVER}
${WELCOME URL}    https://${SERVER}/

*** Test Cases ***
Valid Login
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Welcome to Twitter - Login or Sign up
# Search both fields by name attribute ('signin-email' and 'signin-password') and types the desired value in them.
    Input Text    signin-email    ${VALID USER}
    Input Text    signin-password    ${VALID PASSWORD}
# Finds the login button using xpath and clicks it.
    Click Button    xpath=//*[@id="front-container"]/div[2]/div[2]/form/table/tbody/tr/td[2]/button
    Location Should Be    ${WELCOME URL}
    Title Should Be    Twitter
    [Teardown]    Close Browser
