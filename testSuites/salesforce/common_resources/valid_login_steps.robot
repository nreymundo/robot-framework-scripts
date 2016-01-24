*** Settings ***
Documentation     A resource file for the SF valid login so it can be reused
...               in all the other tests that require you to successfully log in

*** Keywords ***
Login With Working Credentials Should Succeed
      Open Browser To Login Page
      Then Input Username    ${VALID USER}
      Then Input Password    ${VALID PASSWORD}
      Then Submit Credentials
      Then Home Page Should Be Open