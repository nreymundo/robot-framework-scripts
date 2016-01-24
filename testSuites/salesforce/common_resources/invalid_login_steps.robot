*** Settings ***
Documentation     A resource file for the SF invalid login scenarios.

*** Keywords ***
Login With Invalid Credentials Should Fail
  [Arguments]    ${username}    ${password}
  Input Username    ${username}
  Input Password    ${password}
  Submit Credentials
  Login Should Have Failed