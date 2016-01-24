*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               Since the page behaves differently when leaving fields emptythis
...               test case focuses on invalid credentials.
Suite Setup       Open Browser To Login Page
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Suite Teardown    Close Browser
Resource          ./common_resources/resource.robot
Resource          ./common_resources/invalid_login_steps.robot

*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 invalid          ${VALID PASSWORD}
Invalid Password                 ${VALID USER}    invalid
Invalid Username And Password    invalid          whatever

*** Keywords ***
Login Should Have Failed
    Location Should Contain    ${ERROR URL}
    Title Should Be    Login | Salesforce
    Element Should Contain    error    Please check your username and password